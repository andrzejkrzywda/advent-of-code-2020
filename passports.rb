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
        (all_fields? or all_but_cid?) and all_existing_fields_valid?
      end

      private

      def all_but_cid?
        @fields.length == 7 && ! @fields.detect{|field| field.split(":")[0] == "cid"}
      end

      def all_fields?
        @fields.length == 8
      end

      def all_existing_fields_valid?
        valid_byr? and valid_iyr? and valid_eyr? and valid_hgt? and
          valid_hcl? and valid_ecl? and valid_pid?
      end

      def valid_byr?
        byr.length == 4 and byr.to_i >= 1920 and byr.to_i <= 2002
      end

      def valid_iyr?
        iyr.length == 4 and iyr.to_i >= 2010 and iyr.to_i <= 2020
      end

      def valid_eyr?
        eyr.length == 4 and eyr.to_i >= 2020 and eyr.to_i <= 2030
      end

      def valid_hgt?
        HeightBuilder.build(hgt).valid?
      end

      def valid_hcl?
        hcl.length == 7 and
          hcl[0] == "#" and
          (
            hcl.partition("#").last.chars.all?{|char| 0<= char.to_i and char.to_i <= 9} or
            hcl.partition("#").last.chars.all?{|char| "a" <= char and char <= "f"}
          )
      end

      def valid_ecl?
        %w[amb blu brn gry grn hzl oth].include?(ecl)
      end

      def valid_pid?
        pid.length == 9 and pid.chars.all?{|char| 0<= char.to_i and char.to_i <= 9}
      end

      def byr
        find_field("byr")
      end

      def iyr
        find_field("iyr")
      end

      def eyr
        find_field("eyr")
      end

      def hgt
        find_field("hgt")
      end

      def hcl
        find_field("hcl")
      end

      def ecl
        find_field("ecl")
      end

      def pid
        find_field("pid")
      end

      def find_field(name)
        @fields.detect{|field| field.split(":")[0] == name}.split(":")[1]
      end

    end

    class HeightBuilder
      def self.build(content)
        if content.end_with?("cm")
          CmHeight.new(content.partition("cm").first)
        elsif content.end_with?("in")
          InHeight.new(content.partition("in").first)
        else
          InvalidHeight.new
        end
      end
    end

    class CmHeight
      def initialize(content)
        @content = content
      end

      def valid?
        150 <= @content.to_i and @content.to_i <= 193
      end
    end

    class InHeight
      def initialize(content)
        @content = content
      end

      def valid?
        59 <= @content.to_i and @content.to_i <= 76
      end
    end

    class InvalidHeight
      def valid?
        false
      end
    end
  end
end

puts Advent::Passports::Verifier.new(File.read("./input_4.txt")).correct_count

