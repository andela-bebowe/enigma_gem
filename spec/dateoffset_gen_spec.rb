require_relative "spec_helper"

describe "DateOffsetGen obj" do

  before :all do
    @offsetgen = EnigmaEncrypto::DateOffsetGen.new
    @today = @offsetgen.todays_date
  end

  describe "@offsetgen" do

    it "should exist as an obj of OffsetGen" do
    expect(@offsetgen.class).to eql EnigmaEncrypto::DateOffsetGen
    end
    it "should have a non empty today variable" do
      expect(@offsetgen.instance_variable_get(:@todays_date).class) == Time
      expect(@today.nil?).to eql false
      expect(@today.to_s.length).to eql 6
    end

  end

  describe "#get_offset" do

    it "should return last 4 digits of todays square" do
      @offsetgen.todays_date = 301619
      expect(@offsetgen.get_offset) == [1, 1, 6, 1]
    end

  end

  describe "#get_decrypter_offset" do

    it "should return last 4 digits of given date square" do
      expect(@offsetgen.get_decrypter_offset(301619)) == [1, 1, 6, 1]
    end

  end

end