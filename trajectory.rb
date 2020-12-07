module Advent
  module Trajectory

    class TreesEncounter
      def initialize(map_template)
        puts "initialize for: [#{map_template.length}, #{map_template[0].length}]"
        puts map_template[0].inspect
        @map = build_map(map_template)
        @location = [0, 0]
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
        @location[0] = @location[0] + 1
        @location[1] = @location[1] + 3
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
  end
end

puts Advent::Trajectory::TreesEncounter.new(File.readlines("./input_3.txt", chomp: true)).trees_count
