require './passports'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Passports
    class PassportsTest < Minitest::Test

      cover "Advent::Passports"

      def test_valid
        assert true
      end

    end
  end
end