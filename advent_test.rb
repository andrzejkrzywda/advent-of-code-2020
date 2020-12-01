require './advent'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

class AdventTest < Minitest::Test

  cover "Advent"
  def test_fails
    Advent::Report.new
    assert true
  end
end