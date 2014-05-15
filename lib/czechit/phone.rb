module Czechit

  class Phone

    PHONE_REGEXP = '^\+?[0-9]{9,12}$'

    def self.validate?(phone_number)
      re = Regexp.new(PHONE_REGEXP).freeze
      (phone_number =~ re) == 0
    end

  end

end