class ExtractPieceDetails
  class << self
    def process(limit)
      file_for_messages = 'log/extract_piece_details.log'
      message_file = File.new(file_for_messages, 'w')
      limit = limit.to_i
      p 'Producing report pieces'

      message_file.puts 'Producing report pieces'
      message_file.puts "Chapman,Piece Number,Year,File_name"
      num = 0
      time_start = Time.now
      FreecenPiece.each do |piece|
        message_file.puts "#{piece.chapman_code},#{piece.piece_number},#{piece.year},#{piece.freecen1_filename}"
        num = num + 1
        break if num == limit
      end
      time_elapsed = Time.now - time_start
      p "Finished #{num} pieces in #{time_elapsed}"
    end
  end
end
