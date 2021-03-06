# -*- coding: utf-8 -*-

#note: It turns out the info in the mysql database for online times is not
#      accurate, so this function is probably of no use and can be removed.
# Until we decide a more robust way to do it, we are currently reading the
# coverage completion stats directly from the file generated by FC1 to create
# the completion graphs.  We are probably stuck with that until we are updating
# in FC2.
desc "Update piece online times from FC1 mysql output"
task :update_pieces_fc1_online_times, [:csv_file] => :environment do |t, args|
  #to create the csv file, open a mysql session for FC1 and do the following:
  #SELECT * FROM Pieces INTO OUTFILE '/tmp/freecen_pieces.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
  if args[:csv_file].empty?
    puts "ERROR! no input.csv file specified."
    puts "usage rake update_pieces_fc1_online_times[input.csv]"
    puts "(See comments in freecen_pieces.rake for how to create the csv)"
  else
    require "csv"
    # use iso-8859-1 because the FreeCEN1 mysql database is Latin1, not UTF-8
    raw_file = File.read(args[:csv_file], :encoding => 'iso-8859-1')
    raw_file=raw_file.encode('utf-8', :undef => :replace)
    csv_rows = CSV.parse(raw_file) unless raw_file.nil?
    if csv_rows.nil? || csv_rows.length < 1
      puts "ERROR! no csv rows parsed by freecen_pieces.rake - see comments for usage"
    else
      puts "read #{csv_rows.length} rows from the csv file."
      csv_rows.each_with_index do |row, idx|
        #[0]country [1]yearnum [2]piecenum [3]suffix [4]sctpar [5]county
        #[6]districtname [7]subplaces [8]status [9]notes [10]onlineTime
        if row[0]!='ENW' && row[0]!='SCT'
          puts "WARNING: unrecognized series in row #{idx} col 0. Row ignored."
          next
        end
        #assign variables from csv columns
        series = row[0]
        yy = (row[1].to_i * 10 + 1831) #convert year num (1-9) to 1841..1891
        piecenum = row[2]
        sfx = row[3]
        sfx.strip! unless sfx.nil?
        sfx = nil if sfx.blank?
        sctpar = row[4]
        sctpar = nil if sctpar.blank? || 0==sctpar || '0'==sctpar
        cty = row[5]
        dist = row[6]
        pstatus = row[8]
        notes= row[9]
        olt = row[10].to_i
        #find the freecen_piece associated with this row of the csv
        piece = FreecenPiece.where(piece_number:piecenum, chapman_code:cty, year:yy, suffix:sfx, parish_number:sctpar)
        if piece.count > 1
          puts "*** ERROR: #{piece.count} pieces match criteria for line #{idx} (not updating them)"
          
          piece.each do |pp|
            puts "  _id:#{pp[:_id]} yy:#{pp[:year]} cty:#{pp[:chapman_code]} piece:#{pp[:piece_number]} sfx:#{pp[:suffix]} sctpar:#{pp[:parish_number]} dist:#{pp[:district_name]}}}"
          end
          next
        end
        piece = piece.first
        if piece.nil?
          puts "*** ERROR: piece not found for line #{idx+1}. (yy=#{yy} cty=#{cty} piece=#{piecenum} sfx=#{sfx} sctpar=#{sctpar} dist=#{dist}"
          next
        end
        #update the online time of the freecen_piece
        if piece[:online_time] != olt
          piece[:online_time] = olt
          piece.save!
        end

      end

    end
  end
end

#compare subplace names to those in the specified csv file and use the last
#match in the list to assign lat/long. (Using the last match allows us to add
#corrections to the end of the file.)
#The list doesn't have county information, so some places with the same name
#may need to be corrected manually.
desc "Initialize pieces subplaces lat/long from data file"
task :initialize_pieces_subplaces_geo, [:csv_file,:keep_existing] => :environment do |t, args|
  if args[:csv_file].blank?
    puts "ERROR! no input.csv file specified."
    puts "usage rake initialize_pieces_subplaces_geo[input.csv,keep_existing]"
  elsif args[:keep_existing].blank?
    puts "ERROR! keep_existing not specified."
    puts "usage rake initialize_pieces_subplaces_geo[input.csv,keep_existing]"
  else
    keep=args[:keep_existing]
    keep=false if "false"==keep.downcase

    require "csv"
    raw_file = File.read(args[:csv_file])
    csv_rows = CSV.parse(raw_file) unless raw_file.nil?
    if csv_rows.nil? || csv_rows.length < 1
      puts "ERROR! no csv rows parsed by initialize_pieces_subplaces_geo in lib/tasks/freecen_pieces.rake"
    else
      name_to_csv_row_idx = {}
      puts "read #{csv_rows.length} rows from the csv file."
      csv_rows.each_with_index do |row, idx|
        #[0]name [1]lat [2]long [3]source
        #assign variables from csv columns
        name = row[0]
        if name_to_csv_row_idx[name].blank?
          name_to_csv_row_idx[name] = []
        end
        name_to_csv_row_idx[name] << idx
      end
      puts "name_to_csv_row_idx.length=#{name_to_csv_row_idx.length}"
      all_pieces = FreecenPiece.all
      num_found = 0
      num_not_found = 0
      if all_pieces.count > 1
        puts "apply geolocation to subplaces for #{all_pieces.count} pieces..."
        all_pieces.each do |pp|
          if pp['subplaces'].present?
            pp['subplaces'].each_with_index do |sp,sp_idx|
              next if keep && (0!=sp['lat'] || 0!=sp['long'])
              old_lat = sp['lat']
              old_long = sp['long']
              pp.subplaces[sp_idx]['lat'] = 0 unless keep
              pp.subplaces[sp_idx]['long'] = 0 unless keep
              sp_name = sp['name']
              if sp_name.present?
                sp_name = sp_name.downcase.to_s
                sp_name_x1 = ActiveSupport::Inflector.transliterate(sp_name).to_s.gsub(/\p{^Alnum}/,'')
                sp_name_x2 = sp_name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
                #check for matching name in list (or transliterated name)
                geo_idx = nil
                if name_to_csv_row_idx[sp_name].present? && name_to_csv_row_idx[sp_name].length > 0
                  geo_idx = name_to_csv_row_idx[sp_name][name_to_csv_row_idx[sp_name].length-1]#use last match
                elsif name_to_csv_row_idx[sp_name_x1].present? && name_to_csv_row_idx[sp_name_x1].length > 0
                  geo_idx = name_to_csv_row_idx[sp_name_x1][name_to_csv_row_idx[sp_name_x1].length-1]
                  sp_name = sp_name_x1
                elsif name_to_csv_row_idx[sp_name_x2].present? && name_to_csv_row_idx[sp_name_x2].length > 0
                  geo_idx = name_to_csv_row_idx[sp_name_x2][name_to_csv_row_idx[sp_name_x2].length-1]
                  sp_name = sp_name_x2
                end
                if !geo_idx.nil?
                  num_found += 1
                  #sp['lat'] = csv_rows[geo_idx][1]
                  #sp['long'] = csv_rows[geo_idx][2]
                  pp.subplaces[sp_idx]['lat'] = csv_rows[geo_idx][1]
                  pp.subplaces[sp_idx]['long'] = csv_rows[geo_idx][2]
                  #puts "   #{sp_name} found at geo_idx=#{geo_idx} lat=#{sp['lat']} long=#{sp['long']}"
                else
                  num_not_found += 1
                end
                pp.save! if old_lat!=pp.subplaces[sp_idx]['lat'] || old_long!=pp.subplaces[sp_idx]['long']
              end
            end
          end
        end
      else
        puts "no pieces found to apply subplaces!"
      end
      puts "num_found=#{num_found} num_not_found=#{num_not_found}"
    end
  end

  all_pieces = FreecenPiece.all
  num_found = 0
  num_not_found = 0
  num_subplaces = 0
  not_found = []
  puts "all_pieces.count=#{all_pieces.count}"
  if all_pieces.count > 1
    all_pieces.each do |pp|
      found = false
      if pp['subplaces'].present?
        pp['subplaces'].each_with_index do |sp,sp_idx|
          num_subplaces += 1
          found=true if sp['lat'].present? && sp['long'].present? && (0!=sp['lat']||0!=sp['long'])
        end
      end
      num_found += 1 if true==found
      if false==found
        num_not_found += 1
        chap_name = "#{pp.chapman_code}-#{pp.district_name.downcase unless pp.district_name.nil?}"
        not_found << chap_name
      end
    end
  end
  puts "num freecen_pieces with at least one sublace not 0,0=#{num_found} num without=#{num_not_found} num_subplaces=#{num_subplaces}"
  puts "not_found.length=#{not_found.length} uniq=#{not_found.uniq.length}"
  puts "list of not found is commented out"
#  not_found.uniq.each do |pp|
#    puts "#{pp}"
#  end
end



# this task initializes the lat/long for places using the public domain list
# if a name matches (uses the last match found in the csv file).  If no match
# is found but one or more subplaces have lat/long, then the average lat/long
# is used for the place if use_subplaces is not false.
# If keep_existing is not false, then any place with non-zero (and non-60)
# is kept as is instead of replacing the lat/long with matches from the list.
task :initialize_places_geo, [:csv_file,:keep_existing,:use_subplaces] => :environment do |t, args|
  if args[:csv_file].blank?
    puts "ERROR! no input.csv file specified."
    puts "usage rake initialize_places_geo[input.csv,keep_existing]"
  elsif args[:keep_existing].blank?
    puts "ERROR! keep_existing not specified."
    puts "usage rake initialize_places_geo[input.csv,keep_existing]"
  else
    keep=args[:keep_existing]
    keep=false if "false"==keep.downcase
    use_subplaces = false
    if args[:use_subplaces].present?
      use_subplaces = true if 'false'!=args[:use_subplaces].downcase
    end
    puts "keep=#{keep ? 'true' : 'false'} use_subplaces=#{use_subplaces ? 'true' : 'false'}"


    require "csv"
    raw_file = File.read(args[:csv_file])
    csv_rows = CSV.parse(raw_file) unless raw_file.nil?
    if csv_rows.nil? || csv_rows.length < 1
      puts "ERROR! no csv rows parsed by initialize_places_geo in lib/tasks/freecen_pieces.rake"
    else
      name_to_csv_row_idx = {}
      puts "read #{csv_rows.length} rows from the csv file."
      csv_rows.each_with_index do |row, idx|
        #[0]name [1]lat [2]long [3]source
        #assign variables from csv columns
        name = row[0]
        if name_to_csv_row_idx[name].blank?
          name_to_csv_row_idx[name] = []
        end
        name_to_csv_row_idx[name] << idx
      end
      puts "name_to_csv_row_idx.length=#{name_to_csv_row_idx.length}"
        #find the place associated with this row of the csv
      all_places = Place.all
      num_found = 0
      num_not_found = 0
      if all_places.count > 1
        puts "apply geolocation to #{all_places.count} places..."
        all_places.each do |pp|
          if pp['place_name'].present?
            next if keep && ((0.0!=pp['latitude'].to_f && 60.0!=pp['latitude'].to_f) || 0.0!=pp['longitude'].to_f)
            old_lat = pp['latitude']
            old_long = pp['longitude']
            pp.latitude = 0 unless keep
            pp.longitude = 0 unless keep
            sp_name = pp['place_name']
            if sp_name.present?
              sp_name = sp_name.downcase.to_s
              sp_name_x1 = ActiveSupport::Inflector.transliterate(sp_name).to_s.gsub(/\p{^Alnum}/,'')
              sp_name_x2 = sp_name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
              #check for matching name in list (or transliterated name)
              geo_idx = nil
              if name_to_csv_row_idx[sp_name].present? && name_to_csv_row_idx[sp_name].length > 0
                geo_idx = name_to_csv_row_idx[sp_name][0]#use first match
              elsif name_to_csv_row_idx[sp_name_x1].present? && name_to_csv_row_idx[sp_name_x1].length > 0
                geo_idx = name_to_csv_row_idx[sp_name_x1][0]
                sp_name = sp_name_x1
              elsif name_to_csv_row_idx[sp_name_x2].present? && name_to_csv_row_idx[sp_name_x2].length > 0
                geo_idx = name_to_csv_row_idx[sp_name_x2][0]
                sp_name = sp_name_x2
              end
              if !geo_idx.nil?
                num_found += 1
                #sp['lat'] = csv_rows[geo_idx][1]
                #sp['long'] = csv_rows[geo_idx][2]
                pp.latitude = csv_rows[geo_idx][1]
                pp.longitude = csv_rows[geo_idx][2]
                  #puts "   #{sp_name} found at geo_idx=#{geo_idx} lat=#{sp['lat']} long=#{sp['long']}"
              else
                num_not_found += 1
              end
              if old_lat!=pp.latitude || old_long!=pp.longitude
                pp.save!
                #update any pieces that belong to this place
                pcs = pp.freecen_pieces
                if pcs.present?
                  pcs.each do |pc|
                    pc.place_latitude = pp.latitude
                    pc.place_longitude = pp.longitude
                    pc.place_country = pp.country
                    pc.save!
                  end
                end
              end
            end
          end
        end
      else
        puts "no places found to apply subplaces!"
      end
      puts "num_found=#{num_found} num_not_found=#{num_not_found}"
    end
  end

  all_places = Place.all
  num_found = 0
  num_not_found = 0
  num_places = 0
  not_found = []
  puts "all_places.count=#{all_places.count}"
  if all_places.count > 1
    all_places.each do |pp|
      found = false
      num_places += 1
      found=true if pp['latitude'].present? && pp['longitude'].present? && ((0.0!=pp['latitude'].to_f&&60.0!=pp['latitude'].to_f)||0.0!=pp['longitude'].to_f)
      num_found += 1 if true==found
      if false==found
        num_not_found += 1
        chap_name = "#{pp.chapman_code}-#{pp.place_name.downcase}"
        not_found << chap_name
      end
    end
  end
  puts "num places not 0,0 or 60,0=#{num_found} num without=#{num_not_found} num_places=#{num_places}"
  puts "not_found.length=#{not_found.length} uniq=#{not_found.uniq.length}"
  puts "list of not found is commented out"
#  not_found.uniq.each do |pp|
#    puts "#{pp}"
#  end

  #for places not found, use mean lat,long of all associated pieces' subplaces
  if use_subplaces
    puts ">>> use mean lat/long of subplaces for each piece assigned to places"
    num_additional = 0
    num_still_not_found = 0
    all_places.each do |pp|
      found = false
      found=true if pp['latitude'].present? && pp['longitude'].present? && ((0.0!=pp['latitude'].to_f&&60.0!=pp['latitude'].to_f)||0.0!=pp['longitude'].to_f)
#      puts "place #{pp[:place_name]} already has location" if found
      if false==found
        place_pieces = FreecenPiece.where(place: pp).all
        lats = []
        longs = []
        num_subplaces = 0
        num_place_pieces = place_pieces.blank? ? 0 : place_pieces.length
        place_pieces.each do |plcp|
          subplaces = plcp[:subplaces]
          next if subplaces.blank?
          num_subplaces += subplaces.length
          subplaces.each do |sp|
            if sp['lat'].present? && sp['long'].present? && ((sp['lat'].to_f!=0.0 && sp['lat'].to_f!=60.0)||sp['long'].to_f!=0.0)
              lats << sp['lat'].to_f
              longs << sp['long'].to_f
            end
          end
        end
        if lats.length > 0
          # use average lat/long
          num_additional += 1
          pp.latitude = (lats.sum / lats.length.to_f).to_s # average lat
          pp.longitude = (longs.sum / longs.length.to_f).to_s # average long
          pp.save!
          #puts " updated place '#{pp.place_name}' to #{pp.latitude},#{pp.longitude}"
          #update any pieces that belong to this place
          pcs = pp.freecen_pieces
          if pcs.present?
            pcs.each do |pc|
              pc.place_latitude = pp.latitude
              pc.place_longitude = pp.longitude
              pc.place_country = pp.country
              pc.save!
              #puts "  updated piece #{pc.year}-#{pc.chapman_code}-#{pc.piece_number}-#{pc.district_name}"
            end
          end
        else
          num_still_not_found += 1
          
          #puts "#{pp[:chapman_code]},\"#{pp[:place_name]}\",\"***not found***\",#{num_place_pieces},#{num_subplaces}"
          # puts "place #{pp[:place_name]} has #{num_place_pieces} pieces with #{num_subplaces} subplaces (#{lats.length} with location) #{lats.length>0 ? '' : '***still not found***'}"
        end
        # puts "place #{pp[:place_name]} has #{num_place_pieces} pieces with #{num_subplaces} subplaces (#{lats.length} with location) #{lats.length>0 ? '***found***' : ''}"
      end
    end
    puts "assumed location for #{num_additional} based on subplaces"
    puts "location for #{num_still_not_found} still not found"
  else
    puts "do not use subplaces to determine place lat/long."
  end
end



# create the countries and counties in the database, and set all coordinators
# to a valid username so they can be changed to the correct people once the
# coordinators have created userid accounts on the system.
task :initialize_countries_and_counties => :environment do |t|
  require 'chapman_code'

  default_coord = 'dougkdev' #this should be replaced when development done

  #------------------------------------------------------
  # create country entries
  Country.destroy_all

  ctry = Country.new
  ctry.country_coordinator = default_coord
  ctry.country_coordinator_lower_case = default_coord.downcase
  ctry.country_code = 'England'
  ctry.country_description = 'England'
  ctry.counties_included = []
  ChapmanCode::CODES['England'].each_pair do |key,value|
    ctry.counties_included << value
  end
  ChapmanCode::CODES['Islands'].each_pair do |key,value| #channel islands w/ ENG
    ctry.counties_included << value
  end
  ctry.counties_included << 'EWS' #put England/Wales shipping with ENG
  ctry.save

  ctry = Country.new
  ctry.country_coordinator = default_coord
  ctry.country_coordinator_lower_case = default_coord.downcase
  ctry.previous_country_coordinator = default_coord
  ctry.country_code = 'Wales'
  ctry.country_description = 'Wales'
  ctry.counties_included = []
  ChapmanCode::CODES['Wales'].each_pair do |key,value|
    ctry.counties_included << value
  end
  ctry.save
  
  ctry = Country.new
  ctry.country_coordinator = default_coord
  ctry.country_coordinator_lower_case = default_coord.downcase
  ctry.country_code = 'Scotland'
  ctry.country_description = 'Scotland'
  ctry.counties_included = []
  ChapmanCode::CODES['Scotland'].each_pair do |key,value|
    ctry.counties_included << value
  end
  ctry.counties_included << 'SCS' #Scottish shipping is in "Special"
  ctry.save
  
  #------------------------------------------------------
  # create county entries
  County.destroy_all

  all_countries = Country.all
  all_countries.each do |ctry|
    unless ctry.counties_included.blank?
      ctry.counties_included.each do |chap|
        cty = County.new
        cty.chapman_code = chap
        cty.county_description = ChapmanCode.name_from_code(chap)
        cty.county_coordinator = default_coord
        cty.county_coordinator_lower_case = default_coord.downcase
        cty.previous_county_coordinator = default_coord
        cty.save
      end
    end
  end

end
