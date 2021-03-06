class CheckRecordsRegister

  def self.process(chapmancode)
  	file_for_output = "#{Rails.root}/log/register_records.csv"
    FileUtils.mkdir_p(File.dirname(file_for_output) )
    output_file = File.new(file_for_output, "w")
  	
    id = 0
    place = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
    church = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
    record = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
  	
  	puts "========Get Register records"

    chapman_code = chapmancode == 'ALL' ? nil : chapmancode

    places = Place.all
    places.each do |entry|
      place[entry.id]['chapman_code'] = entry.chapman_code
      place[entry.id]['place_name'] = entry.place_name
    end
    
    churches = Church.all
    churches.each do |entry|
      church[entry.id]['place_id'] = entry.place_id
      church[entry.id]['church_name'] = entry.church_name
      church[entry.id]['place_name'] = place[entry.place_id]['place_name']
      church[entry.id]['chapman_code'] = place[entry.place_id]['chapman_code']
    end

    registers = Register.all
    registers.each do |entry|
      entry.attributes.each do |k,v|
        if k == '_id'
          record[v] = Hash.new if record[k].nil?
          id = v
        end
      end

      entry.attributes.each do |k,v| 
        if ['_id', 'place_id', 'register_notes'].include? k
          record[id][k] = v.to_s.gsub("\r\n", "")
        else
          record[id][k] = v
        end

        if k == 'transcribers' || k == 'contributors'
          record[id][k].delete('total') if record[id][k].key?('total')
        end
      end

      if record[id]['church_id'].present? && (chapman_code.nil? || church[record[id]['church_id']]['chapman_code'] == chapman_code)
          record[id]['chapman_code'] = church[record[id]['church_id']]['chapman_code']
          record[id]['place_name'] = church[record[id]['church_id']]['place_name']
          record[id]['church_name'] = church[record[id]['church_id']]['church_name']
      else
        record.delete(id)
      end
    end

    record.each do |k1,v1|
      record[k1]['alternate_register_name'] = '' if not record[k1].key?('alternate_register_name')
      record[k1]['chapman_code'] = '' if not record[k1].key?('chapman_code')
      record[k1]['church_id'] = '' if not record[k1].key?('church_id')
      record[k1]['church_name'] = '' if not record[k1].key?('church_name')
      record[k1]['contributors'] = '' if not record[k1].key?('contributors')
      record[k1]['copyright'] = '' if not record[k1].key?('copyright')
      record[k1]['credit'] = '' if not record[k1].key?('credit')
      record[k1]['credit_from_files'] = '' if not record[k1].key?('credit_from_files')
      record[k1]['datemax'] = '' if not record[k1].key?('datemax')
      record[k1]['datemin'] = '' if not record[k1].key?('datemin')
      record[k1]['daterange'] = '' if not record[k1].key?('daterange')
      record[k1]['minimum_year_for_register'] = '' if not record[k1].key?('minimum_year_for_register')
      record[k1]['maximum_year_for_register'] = '' if not record[k1].key?('maximum_year_for_register')
      record[k1]['place_name'] = '' if not record[k1].key?('place_name')
      record[k1]['quality'] = '' if not record[k1].key?('quality')
      record[k1]['record_type'] = '' if not record[k1].key?('record_type')
      record[k1]['register_name'] = '' if not record[k1].key?('register_name')
      record[k1]['register_notes'] = '' if not record[k1].key?('register_notes')
      record[k1]['register_type'] = '' if not record[k1].key?('register_type')
      record[k1]['records'] = '' if not record[k1].key?('records')
      record[k1]['source'] = '' if not record[k1].key?('source')
      record[k1]['status'] = '' if not record[k1].key?('status')
      record[k1]['transcribers'] = '' if not record[k1].key?('transcribers')
   end

    sorted_record = record.inject({}) do |h, (k, v)|
      h[k] = Hash[v.sort_by {|k1,v1| k1}]
      h
    end

    csv_string = ['id','register_name','alternate_register_name','register_type','chapman_code','place_name','church_name','status','quality','source','copyright','register_notes','credit','minimum_year_for_register','maximum_year_for_register','credit_from_files','records','last_amended','datemin','datemax','transcribers','contributors'].to_csv
    output_file.puts csv_string

    sorted_record.each do |k1,v1|
      record_str = Array.new

      record_str << k1
      record_str << v1['register_name']
      record_str << v1['alternate_register_name']
      record_str << v1['register_type']
      record_str << v1['chapman_code']
      record_str << v1['place_name']
      record_str << v1['church_name']
      record_str << v1['status']
      record_str << v1['quality']
      record_str << v1['source']
      record_str << v1['copyright']
      record_str << v1['register_notes']
      record_str << v1['credit']
      record_str << v1['minimum_year_for_register']
      record_str << v1['maximum_year_for_register']
      record_str << v1['credit_from_files']
      record_str << v1['records']
      record_str << v1['last_amended']
      record_str << v1['datemin']
      record_str << v1['datemax']
      record_str << v1['transcribers']
      record_str << v1['contributors']

      csv_string = record_str.to_csv
      output_file.puts csv_string
    end
    output_file.close 
  end
end
