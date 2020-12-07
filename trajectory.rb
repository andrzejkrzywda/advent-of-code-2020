module Advent
  module Trajectory

    class TreesEncounter
      def initialize(map_template, slope)
        puts "initialize for: [#{map_template.length}, #{map_template[0].length}]"
        puts map_template[0].inspect
        @map = build_map(map_template)
        @location = [0, 0]
        @slope = slope
      end

      def trees_count
        count = 0
        while @location[0] < @map.depth - 1
          jump
          count += 1 if @map.tree_at_location?(@location)
        end
        count
      end

      def jump
        @location[0] = @location[0] + @slope.right
        @location[1] = @location[1] + @slope.down
      end

      private

      def build_map(map_template)
        TobboganMap.new(map_template)
      end
    end

    class TobboganMap
      def initialize(map_template)
        @map_template = map_template
      end

      def tree_at_location?(location)
        row = @map_template[location[0]]
        col_modulo = (location[1] % @map_template[0].length)
        row[col_modulo] == "#"
      end

      def depth
        @map_template.length
      end
    end

    class Slope
      attr_reader :right, :down

      def initialize(right, down)
        @right = right
        @down  = down
      end
    end
  end
end

map_template = File.readlines("./input_3.txt", chomp: true)
slopes =
  [
    Advent::Trajectory::Slope.new(1, 1),
    Advent::Trajectory::Slope.new(1, 3),
    Advent::Trajectory::Slope.new(1, 5),
    Advent::Trajectory::Slope.new(1, 7),
    Advent::Trajectory::Slope.new(2, 1)
  ]

trees_counters = []
slopes.each do |slope|
  trees_encounter  = Advent::Trajectory::TreesEncounter.new(map_template, slope)
  trees_counters << trees_encounter.trees_count
end

puts trees_counters.inject(&:*)

