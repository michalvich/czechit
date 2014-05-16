require "spec_helper"

describe Czechit::BirthNumber do

  it "return true for valid birth number" do
    described_class.validate?("8003153180").should == true
  end

  it "return false for valid birth number" do
    described_class.validate?("80031531802").should == false
  end


end