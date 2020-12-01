require './advent'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

class AdventTest < Minitest::Test

  cover "Advent"
  def test_happy
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
    assert_equal(514579, report.calculate)
  end
end