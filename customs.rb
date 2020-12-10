module Advent
  module Customs
    class AnswersCounter
      def initialize(answers)
        @answers = answers
      end

      def count
        groups = @answers.split("\n\n")
        sum = 0
        groups.each do |group|
          sum += group.split("\n").join.chars.uniq.length
        end
        sum
      end
    end
  end
end

puts Advent::Customs::AnswersCounter.new(File.read("./input_6.txt")).count
