require_relative "spec_helper"

describe "Crack" do

  before :all do
    @crack = EnigmaEncrypto::Crack.new
  end

  describe "Crack object @crack" do
    
    it "should be a crack object" do
      expect(@crack.class).to be EnigmaEncrypto::Crack
    end
    it "should have an instance of Rotator obj" do
      expect(@crack.instance_variable_get(:@rotator).class) == EnigmaEncrypto::Rotator
    end
    it "should have an instance of FileHandler obj" do
      expect(@crack.instance_variable_get(:@file_handler).class) == EnigmaEncrypto::FileHandler
    end
    it "should have an instance of RotationNumGen obj" do
      expect(@crack.instance_variable_get(:@rotation_num_gen).class) == EnigmaEncrypto::RotationNumGen
    end

  end

  describe "methods" do

    before :each do
      @crack.instance_variable_set(:@encrypted, "encrypted.txt")
      @crack.instance_variable_set(:@cracked, "cracked.txt")
      @crack.instance_variable_set(:@date, "300915")
    end

    describe "#get_command_args" do
    
      it "should be false for incorrect number of argument" do
        expect(@crack.get_command_args).to eql false
      end

    end

    describe "#check_command_args" do

      it "should return true for valid files" do
        expect(@crack.check_command_args) == true
      end
      it "should be false for invalid files" do
        @crack.instance_variable_set(:@encrypted, "empty.txt")
        expect(@crack.check_command_args) == false
      end

    end

    describe "#get_crack_key" do
      it "should return an array of size four" do
        expect(@crack.get_crack_key.class).to eql Array
      end
      it "should contain four elements" do
        expect(@crack.get_crack_key.size).to eq 4
      end
      it "should give accurate result" do
        expect(@crack.get_crack_key).to eq [-15, 14, -18, -36]
      end
    end

    describe "#action" do
      it "#should exit if error occurs" do
        expect { @crack.action }.to raise_error(SystemExit)
      end
    end

  end  

end