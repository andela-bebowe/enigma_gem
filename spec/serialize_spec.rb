require_relative "spec_helper"

describe "Serialize" do
  before :all do
    @serializer = EnigmaEncrypto::Serialize.new(["-1", "-4", "9", "-35"])
  end

  describe "@serializer" do
    it "should be a Serialize obj" do
      expect(@serializer.class).to be EnigmaEncrypto::Serialize
    end
    it "should have a key value" do
      expect(@serializer.instance_variable_get(:@key).nil?).to be false
    end
  end

  describe "#methods" do
    describe "#make_all_keys_positive" do
      it "should change negative key values to positive" do
        expect(@serializer.make_all_keys_positive) == (["38", "35", "09", "04"])
      end
    end

    describe "#create_original_key_array" do
      it "should return an array of serialized keys" do
        expect(@serializer.create_original_key_array) == (["77", "74", "48", "82"])
      end
    end

    describe "#make_new_key_string" do
      it "should return a five string key" do
        expect(@serializer.make_new_key_string.length) == 5
      end
      it "should return correct key string" do
        expect(@serializer.make_new_key_string).to eq "77482"
      end
    end

    describe "#action" do
      it "should return key string" do
        expect(@serializer.action).to eq "77482"
      end
    end
  end
end
