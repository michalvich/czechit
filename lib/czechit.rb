require "czechit/version"
require 'czechit/phone'

module Czechit

  def self.validate?(phone_number)
    phone = Phone.new
    phone.validate?(phone_number)
  end

end