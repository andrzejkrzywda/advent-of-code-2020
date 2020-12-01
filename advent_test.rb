require './advent'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

class AdventTest < Minitest::Test

  cover "Advent"
  def test_2_numbers
    input =
      [
        1721,
        979,
        366,
        299,
        675,
        1456
      ]
    report = Advent::Report.new(input)
    assert_equal(514579, report.calculate_2_numbers(2020))
  end

  def test_3_numbers
    input =
      [
        979,
        366,
        675
      ]
    report = Advent::Report.new(input)
    assert_equal(241861950, report.calculate_3_numbers)
  end
end