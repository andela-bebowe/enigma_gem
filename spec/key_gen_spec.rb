require_relative "spec_helper"

describe "KeyGen" do

  before :all do
    @keygen = EnigmaEncrypto::KeyGen.new
    @rand_num = @keygen.rand_num
    @keys = @keygen.initial_rotation_keys
    @decryption_key = @keygen.initial_decryption_keys("12345")
  end

  describe "@keygen" do

    it "should exist as an obj of KeyGen" do
      expect(@keygen.class).to eql EnigmaEncrypto::KeyGen
    end
    it "should have an instance variables" do
      expect(@keygen.instance_variable_get(:@rand_num).class) == Random
    end

  end

  describe "#initial_rotation_keys" do

    it "should return an array of four numbers." do
      expect(@keys.class).to equal(Array)
      expect(@keys.nil?).to eql false
      @keygen.rand_num = "12345"
      expect(@keygen.initial_rotation_keys).to eq [12, 23, 34, 45]
    end

  end

  describe "#display_key" do

    it "should show key for encryption" do
      @keygen.rand_num = ["1", "2", "3", "4", "5"]
      expect(@keygen.display_key).to eql "12345"
    end

  end

  describe "#initial_decryption_keys" do

    it "should return an array of four numbers." do
      expect(@decryption_key.class).to equal(Array)
      expect(@decryption_key.nil?).to eql false
      expect(@decryption_key) == ([12, 23, 34, 45])
    end

  end

end