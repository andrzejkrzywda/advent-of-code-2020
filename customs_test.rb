require './customs'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Customs
    class CustomsTest < Minitest::Test

      cover "Advent::Customs"

      def test_works
        assert true
      end

    end
  end
end