require "spec_helper"

describe Czechit::IdentificationNumber do

  it "return true for valid identification number" do
    described_class.validate?("46960643").should == true
  end

  it "return false for invalid identification number" do
    described_class.validate?("46960646").should == false
  end

  it "return false for invalid 9 digits identification number" do
    described_class.validate?("469606431").should == false
  end

end