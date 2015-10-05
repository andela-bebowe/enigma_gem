require_relative "spec_helper"

describe "Cracker" do
  before :all do
    opened_file = File.open("encrypted.txt", "r")
    length = opened_file.size
    @cracker = EnigmaEncrypto::Cracker.new(opened_file, length, 7225)
  end
  
  describe "Cracker object" do
    it "should be an instance of Cracker class" do
      expect(@cracker).to be_an_instance_of EnigmaEncrypto::Cracker
    end
    it "should have a character_map" do
      expect(@cracker.instance_variable_get(:@character_map).nil?).to be false
    end
  end
  
  describe "#locate_position_to_start_crack" do
    it "should return a number less than 7" do
      expect(@cracker.locate_position_to_start_crack).to be 3
    end
  end

  describe "#needed_four_of_file" do
    it "should return an array of four elements" do
      expect(@cracker.needed_four_of_file.size).to be 4
    end
  end

  describe "#the_end_arr" do
    it "should index for character in character_map" do
      expect(@cracker.the_end_arr).to eq [37,37,4,13,3,37,37]
    end
  end

  describe "#creating_key" do
    it "should create an array of keys" do
      expect(@cracker.creating_key).to eq [-9, 16, -16, -32]
    end
  end

  describe "#get_key" do
    it "get_key by calling all methods" do
      expect(@cracker.get_key).to eq [-9, 16, -16, -32]
    end
  end
end