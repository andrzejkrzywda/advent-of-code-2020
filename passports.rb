module Advent
  module Passports
    class Verifier
      def initialize(input)
        @passports = Builder.new(input).build_passports
      end

      def correct_count
        @passports.count {|passport| passport.valid?}
      end
    end

    class Builder
      def initialize(input_string)
        @input_string = input_string
      end

      def build_passports
        @input_string.split("\n\n").map do |passport_fields|
          Passport.new(passport_fields.split(Regexp.union(delimeteres)))
        end
      end

      private

      def delimeteres
        ["\n", " "]
      end
    end

    class Passport
      def initialize(fields)
        @fields = fields
      end

      def valid?
        all_fields? or all_but_cid?
      end

      private

      def all_but_cid?
        @fields.length == 7 && ! @fields.detect{|field| field.split(":")[0] == "cid"}
      end

      def all_fields?
        @fields.length == 8
      end
    end
  end
end

puts Advent::Passports::Verifier.new(File.read("./input_4.txt")).correct_count

