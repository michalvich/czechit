module Czechit

  class BirthNumber

    BIRTH_NUMBER = '^\s*(\d\d)(\d\d)(\d\d)[ /]*(\d\d\d)(\d?)\s*$'

    def self.validate?(birth_number)
      
      re = Regexp.new(BIRTH_NUMBER).freeze

      year, month, day, ext, c = birth_number.scan(/^\s*(\d\d)(\d\d)(\d\d)[ \/]*(\d\d\d)(\d?)\s*$/).flatten

      if (birth_number =~ re) == 0

        year_number = year.to_i
        month_number = month.to_i
        day_number = day.to_i

        # we can't check 9 digits numbers before year 1954
        return year_number < 54 if c==nil

        mod = calculate_modulo(year, month, day, ext)

        if mod.to_s != c
          return false
        end

        year_number += year_number < 54 ? 2000 : 1900

        if month_number > 70 && year_number > 2003
          month_number -= 70
        elsif month_number > 50
          month_number -= 50
        elsif month_number > 20 && year_number > 2003
          month_number -= 20
        end

        return Date.valid_date? year_number, month_number, day_number

      else
        return false
      end

    end

    private

    def self.calculate_modulo(year, month, day, ext)

      mod = (year + month + day + ext).to_i % 11

      if mod == 10
        mod = 0
      end

      return mod

    end

  end

end
