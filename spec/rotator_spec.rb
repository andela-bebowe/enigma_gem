require_relative "spec_helper"

describe "Rotator" do
  before :all do
    @rotator = EnigmaEncrypto::Rotator.new
  end

  describe "Rotator obj" do
    it "should be an object of Rotator class" do
      expect(@rotator).to be_an_instance_of EnigmaEncrypto::Rotator
    end
  end

  describe "#character_map_creation" do
    it "should create array" do
      expect(@rotator.character_map_creation.class).to be Array
    end
    it "should create array that contains lowercase letters" do
      expect(@rotator.character_map_creation.include? "g" && "f").to eq true
    end
    it "should create array that contains numbers" do
      expect(@rotator.character_map_creation.include? "4" && "7").to eq true
    end
    it "should create array that contains period, comma and space" do
      expect(@rotator.character_map_creation.include? "," && "." && " ").to eq true
    end
    it "should not contain Upcase letter" do
      expect(@rotator.character_map_creation.include? "G" && "F") == false
    end
  end

  describe "#rotator" do
    it "should return a hash of character_map and rotated character_map" do
      expect(@rotator.rotator(5).is_a? Hash).to eq true
      rotated_characters = @rotator.rotator(5)
      expect(rotated_characters["a"]).to eql "f"
    end
  end

  describe "#rotate_text" do
    it "should return a rotated string text" do
      rotate_text = @rotator.rotate_text("r", 1)
      expect(rotate_text.class).to eq String
      expect(rotate_text).to eql "s"
    end
  end

  describe "#reverse_text" do
    it "should rotate backwards" do
      reverse_text = @rotator.reverse_text("r", 1)
      expect(reverse_text.class).to eq String
      expect(reverse_text).to eql "q"
    end
  end
end
