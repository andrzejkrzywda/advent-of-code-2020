module Advent
  class Report
    def initialize(input)
      @input = input
    end

    def calculate_2_numbers(target, numbers = @input)
      numbers.each do |number|
        diff = target - number
        next if ! numbers.include?(diff)
        return number * diff
      end
      nil
    end

    def calculate_3_numbers(numbers = @input)
      numbers.each do |number|
        diff = 2020 - number
        result = calculate_2_numbers(diff, numbers)
        next if result.nil?
        return number * result
      end
    end
  end
end

puts Advent::Report.new(File.readlines('input_1.txt').map(&:to_i)).calculate_3_numbers