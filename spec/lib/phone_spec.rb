require "spec_helper"

describe Czechit do

  it "return false for invalid number" do
    described_class.validate?("12345678").should == false
  end

  it "returns true for valid number" do
    described_class.validate?("722456958").should == true
  end

  it "returns true for valid number with spaces" do
    described_class.validate?("722 456 958").should == true
  end

  it "returns true for valid number with prefix" do
    described_class.validate?("+420722456958").should == true
  end

  it "returns true for valid number wtih prefix and spaces" do
    described_class.validate?("+420 722 456 958").should == true
  end

end