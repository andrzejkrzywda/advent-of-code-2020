module Advent
  class Report
    def initialize(input)
      @input = input
    end

    def calculate_2_numbers(target, numbers = @input)
      numbers.each do |number|
        diff = target - number
        if numbers.include?(diff)
          return number * diff
        end
      end
    end

    def calculate_3_numbers(numbers = @input)
      numbers.each do |number|
        diff = 2020 - number
        calculate_2_numbers(diff, numbers)
      end

    end

  end
end

#puts Advent::Report.new(File.readlines('input_1.txt').map(&:to_i)).calculate_2_numbers