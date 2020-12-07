require './trajectory'
require 'minitest/autorun'
require 'mutant/minitest/coverage'

module Advent
  module Trajectory
    class TrajectoryTest < Minitest::Test

      cover "Advent::Trajectory"

      def test_valid
        assert_equal(7, TreesEncounter.new(map_template.split).trees_count)
      end

      def map_template
<<TREESMAP
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
TREESMAP
      end
    end

  end
end