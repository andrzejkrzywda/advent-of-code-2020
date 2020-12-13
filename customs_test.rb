require './customs'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Customs
    class CustomsTest < Minitest::Test

      cover "Advent::Customs"

      def test_works
        answers =
        <<ANSWERS
abc

a
b
c

ab
ac

a
a
a
a

b
ANSWERS
        assert_equal(6, AnswersCounter.new(answers).count)
      end

    end
  end
end