require './boarding'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Passports
    class PassportsTest < Minitest::Test

      cover "Advent::Boarding"

      def test_works
        assert true
      end
    end
  end
end