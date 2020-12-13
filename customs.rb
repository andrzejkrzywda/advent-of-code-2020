module Advent
  module Customs
    class AnswersCounter
      def initialize(answers)
        @answers = answers
      end

      def count
        groups_of_people = @answers.split("\n\n")
        sum = 0
        groups_of_people.each do |group_of_people|
          group_of_people_answers = []
          group_of_people.split("\n").each do |person_survey|
            person_survey.chars.each do |yes_answer|
              group_of_people_answers << yes_answer
            end
          end
          group_of_people_answers.uniq.each do |answer|
            sum += 1 if group_of_people.count(answer) == group_of_people.split("\n").count
          end
        end
        sum
      end
    end
  end
end

puts Advent::Customs::AnswersCounter.new(File.read("./input_6.txt")).count
