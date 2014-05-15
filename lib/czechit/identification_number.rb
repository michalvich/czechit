module Czechit

  class IdentificationNumber

    IDENTIFICATION_NUMBER = '^\d{8}$'

    def self.validate?(identification_number)
      re = Regexp.new(IDENTIFICATION_NUMBER).freeze
      if (identification_number =~ re) == 0
        return calculate?(identification_number)
      else
        return false
      end

    end

    private

    def self.calculate?(identification_number)

      seven_digits = 0

      for i in 0..6
        seven_digits += identification_number[i].to_i * (8 - i)
      end

      seven_digits_modulo = seven_digits % 11

      case seven_digits_modulo
        when 0, 10
          expected_seventh_digit = 1
        when 1
          expected_seventh_digit = 0
        else
          expected_seventh_digit = 11 - seven_digits_modulo
      end

      return identification_number[7].to_i == expected_seventh_digit

    end

  end

end
