module Czechit

  class Phone

    def validate?(phone_number)
      re = Regexp.new('^[+]?[()/0-9. -]{9,}$').freeze
      (phone_number =~ re) == nil ? false : true
    end

  end

end