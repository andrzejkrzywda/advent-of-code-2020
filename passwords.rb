module Advent
  module Passwords
    class InvalidPassword < StandardError; end

    class Password
      def self.with_policy(password_with_policy)
        policy_content = password_with_policy.split(": ")[0]
        password       = password_with_policy.split(": ")[1]

        how_many = policy_content.split(' ')[0]
        what     = policy_content.split(' ')[1]

        how_many_start = how_many.split('-')[0].to_i
        how_many_end   = how_many.split('-')[1].to_i

        policy = Policy.new(how_many_start..how_many_end, what)
        Password.new(password, policy)
      end

      def initialize(content, policy)
        raise InvalidPassword unless policy.matches?(content)
      end
    end

    class Policy
      def initialize(how_many, what)
        @how_many = how_many
        @what     = what
      end

      def matches?(password_content)
        @how_many === password_content.count(@what)
      end
    end

  end
end

lines = File.readlines("./input_2.txt")

count = 0
lines.count do |line|
  begin
    Advent::Passwords::Password.with_policy(line)
    count += 1
  rescue
    next
  end
end

puts count