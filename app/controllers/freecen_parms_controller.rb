class FreecenParmsController < ApplicationController
  #  skip_before_action :require_login #TODO: remove this once development done

  def download
    @chapman = params[:chapman_code] if params[:chapman_code].present?
    @year = params[:year] if params[:year].present?
    @format = 'csv'
    @format = params[:format] if params[:format].present?
    if @year.blank? || @chapman.blank?
      # need to set an error message and go back
    elsif 'dat'==@format.downcase
      #no need for app/views/freecen_parms/download.dat.erb because
      #data is generated by the model, we just need to send it
      out_string = FreecenParms.generate_parms_dat(@year, @chapman)
      send_data out_string, filename: "#{@year}_#{@chapman}PARMS.DAT", type: 'application/octet-stream'
    elsif 'csv'==@format.downcase
      #no need for app/views/freecen_parms/download.csv.erb
      #data generated by the model, we just need to send it
      out_string = FreecenParms.generate_parms_csv(@year, @chapman)
      send_data out_string, filename: "#{@year}_#{@chapman}PARMS.CSV", type: 'text/csv'
    else
      # need to set an error message and go back
    end
  end

end