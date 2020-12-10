require './boarding'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Boarding
    class BoardingTest < Minitest::Test

      cover "Advent::Boarding"

      def test_works
        assert_equal(44, RowAndSeatFinder.new("FBFBBFFRLR").row)
        assert_equal(5, RowAndSeatFinder.new("FBFBBFFRLR").seat)
        assert_equal(357, RowAndSeatFinder.new("FBFBBFFRLR").seat_id)

        assert_equal(14, RowAndSeatFinder.new("FFFBBBFRRR").row)
        assert_equal(7, RowAndSeatFinder.new("FFFBBBFRRR").seat)
        assert_equal(119, RowAndSeatFinder.new("FFFBBBFRRR").seat_id)

        assert_equal(102, RowAndSeatFinder.new("BBFFBBFRLL").row)
        assert_equal(4, RowAndSeatFinder.new("BBFFBBFRLL").seat)
        assert_equal(820, RowAndSeatFinder.new("BBFFBBFRLL").seat_id)
      end

    end
  end
end