module Advent
  class Report
    def initialize(input)
      @input = input
    end

    def calculate_2_numbers(target, numbers = @input)
      first, second = find_two_numbers(target, numbers)
      first * second
    end

    def calculate_3_numbers(numbers = @input)
      numbers.each do |number|
        diff = 2020 - number
        second, third = find_two_numbers(diff, numbers)
        puts number, second, third
        return number * second * third
      end
    end

    private

    def find_two_numbers(target, numbers)
      numbers.each do |number|
        diff = target - number
        if numbers.include?(diff)
          return number, diff
        end
      end
    end

  end
end

puts Advent::Report.new(File.readlines('input_1.txt').map(&:to_i)).calculate_3_numbers