module Advent
  module Boarding
    class RowAndSeatFinder
      def initialize(code)
        @code = code
      end

      def row
        @code[0...7].gsub("F", "0").gsub("B", "1").to_i(2)
      end

      def seat
        @code[7..9].gsub("R", "1").gsub("L", "0").to_i(2)
      end

      def seat_id
        row * 8 + seat
      end
    end
  end
end

codes = File.readlines("./input_5.txt")
finders = codes.map{|code| Advent::Boarding::RowAndSeatFinder.new(code)}
seat_ids = finders.map{|finder| finder.seat_id}
puts seat_ids.max
