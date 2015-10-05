require_relative "spec_helper"

describe "RotationNumGen" do
  before :all do
    @rotation_num_gen = EnigmaEncrypto::RotationNumGen.new
  end

  describe "RotationNumGen obj" do
    it "should be an instance of RotationNumGen" do
      expect(@rotation_num_gen.class).to be EnigmaEncrypto::RotationNumGen
    end
    it "should have an Array of key values" do
      expect(@rotation_num_gen.instance_variable_get(:@key).class) == EnigmaEncrypto::KeyGen
      expect(@rotation_num_gen.key.nil?).to be false
      expect(@rotation_num_gen.key.is_a? Array) == true
    end
    it "should have an Array of offset values" do
      expect(@rotation_num_gen.instance_variable_get(:@today_date).class) == EnigmaEncrypto::DateOffsetGen
      expect(@rotation_num_gen.offset.nil?).to be false
      expect(@rotation_num_gen.offset.is_a? Array) == true
    end
  end

  describe "#rotation_num_array" do
    it "should return correct rotation number" do
      @rotation_num_gen.offset = [2,3,4,5]
      @rotation_num_gen.key = [12,24,45,56]
      expect(@rotation_num_gen.rotation_num_array).to eq [14,27,49,61]
    end
  end

  describe "#reverse_num_array" do
    it "should get rotation number for decryption" do
      array = @rotation_num_gen.reverse_num_array("12345", "201514")
      expect(array).to eq [14,24,43,51]
    end
  end

  describe "#crack_num_arr" do
    it "should get rotation number for decryption" do
      array = @rotation_num_gen.crack_num_arr([2,3,4,5], [12,24,45,56])
      expect(array).to eq [14,27,49,61]
    end
  end
end
