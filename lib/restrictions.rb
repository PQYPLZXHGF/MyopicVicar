class Restrictions
  include Mongoid::Document

  def self.process(limit)
    Mongoid.load!("#{Rails.root}/config/mongoid.yml")
    file_for_warning_messages = "log/restrictions.log"
    FileUtils.mkdir_p(File.dirname(file_for_warning_messages) )
    message_file = File.new(file_for_warning_messages, "w")
    limit = limit.to_i
    puts "checking #{limit} documents for restrictions"
    num = 0
    p Source.all.length
    Source.each do |my_source|

      num = num + 1
      break if num == limit
      message_file.puts "#{my_source.creating_institution}, #{my_source.holding_institution}, #{my_source.restrictions_on_use_by_creating_institution}, #{my_source.restrictions_on_use_by_holding_institution}"
    end #place


  end
end
