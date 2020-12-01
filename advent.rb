module Advent
  class Report
    def initialize(input)
      @input = input
    end

    def calculate
      @input.each do |number|
        diff = 2020 - number
        if @input.include?(diff)
          return number * diff
        end
      end
    end
  end
end