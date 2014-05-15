require "spec_helper"

describe Czechit::Phone do

  it "return false for invalid number with length 8" do
    described_class.validate?("12345678").should == false
  end

  it "returns true for valid number" do
    described_class.validate?("722456958").should == true
  end

  it "returns false for number with spaces" do
    described_class.validate?("722 456 958").should == false
  end

  it "returns true for valid number with prefix" do
    described_class.validate?("+420722456958").should == true
  end

  it "returns false for invalid number with prefix length 13" do
    described_class.validate?("+4207224569581").should == false
  end

end