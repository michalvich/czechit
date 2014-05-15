module Czechit

  class Phone

    @@PHONE_FORMAT = '^[+]?[()/0-9. -]{9,}$'

    def self.validate?(phone_number)
      re = Regexp.new(@@PHONE_FORMAT).freeze
      (phone_number =~ re) == nil ? false : true
    end

  end

end