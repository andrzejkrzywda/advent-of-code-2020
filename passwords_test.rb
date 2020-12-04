require './passwords'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Passwords
    class RangedPasswordsTest < Minitest::Test

      cover "Advent::Passwords"

      def test_valid
        assert Password.with_ranged_policy("1-3 a: abcde")
      end

      def test_invalid
        assert_raises InvalidPassword do
          Password.with_ranged_policy("1-3 b: cdefg")
        end
      end
    end

    class PositionedPasswordsTest < Minitest::Test
      cover "Advent::Passwords"

      def test_valid
        assert Password.with_positioned_policy("1-3 a: abcde")
      end

      def test_invalide
        assert_raises InvalidPassword do
          Password.with_positioned_policy("1-3 b: cdefg")
        end
      end
    end
  end
end