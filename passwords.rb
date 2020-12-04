module Advent
  module Passwords
    class InvalidPassword < StandardError; end

    class Password
      def self.with_ranged_policy(password_with_policy)
        policy_content = password_with_policy.split(": ")[0]
        password       = password_with_policy.split(": ")[1]

        how_many = policy_content.split(' ')[0]
        what     = policy_content.split(' ')[1]

        how_many_start = how_many.split('-')[0].to_i
        how_many_end   = how_many.split('-')[1].to_i

        policy = RangedCharacterPolicy.new(how_many_start..how_many_end, what)
        Password.new(password, policy)
      end

      def self.with_positioned_policy(password_with_policy)
        policy_content = password_with_policy.split(": ")[0]
        password       = password_with_policy.split(": ")[1]

        positions = policy_content.split(' ')[0]
        what     = policy_content.split(' ')[1]

        first_position    = positions.split('-')[0].to_i
        second_position   = positions.split('-')[1].to_i

        policy = PositionedPolicy.new(first_position, second_position, what)
        Password.new(password, policy)
      end

      def initialize(content, policy)
        raise InvalidPassword unless policy.matches?(content)
      end
    end

    class RangedCharacterPolicy
      def initialize(how_many, what)
        @how_many = how_many
        @what     = what
      end

      def matches?(password_content)
        @how_many === password_content.count(@what)
      end
    end

    class PositionedPolicy
      def initialize(first_position, second_position, character)
        @first_postion   = first_position
        @second_position = second_position
        @character       = character
      end

      def matches?(password_content)
        (password_content[@first_postion-1] == @character) && (password_content[@second_position-1] != @character) ||
        (password_content[@first_postion-1] != @character) && (password_content[@second_position-1] == @character)
      end
    end

  end
end

lines = File.readlines("./input_2.txt")

count = 0
lines.count do |line|
  begin
    Advent::Passwords::Password.with_positioned_policy(line)
    count += 1
  rescue
    next
  end
end

puts count