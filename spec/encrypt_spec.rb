require_relative "spec_helper"

describe "Encrypt", fakefs: true do
  before :all do
    @encrypter = EnigmaEncrypto::Encrypt.new
  end

  describe "@encrypter" do
    it "should be an Encrypt obj" do
      expect(@encrypter.class).to be EnigmaEncrypto::Encrypt
    end
    it "should have an instance of Rotator obj" do
      expect(@encrypter.instance_variable_get(:@rotator).class) == EnigmaEncrypto::Rotator
    end
    it "should have an instance of FileHandler obj" do
      expect(@encrypter.instance_variable_get(:@file_handler).class) == EnigmaEncrypto::FileHandler
    end
    it "should have an instance of RotationNumGen obj" do
      expect(@encrypter.instance_variable_get(:@rotation_num_gen).class) == EnigmaEncrypto::RotationNumGen
    end
  end

  describe "#get_command_args" do
    it "should be false for incorrect number of argument" do
      expect(@encrypter.get_command_args).to eql false
    end
  end

  describe "#check_command_args" do
    before :all do
      @encrypter.instance_variable_set(:@message, "testfile.txt")
      @encrypter.instance_variable_set(:@encrypted, "encrypted.txt")
    end

    it "should return true for valid files" do
      expect(@encrypter.check_command_args) == true
    end
    it "should be false for 'cancel' operation" do
      #@encrypter.stub(:operation).and_return("c")
      expect(@encrypter.check_command_args) == false
    end
    it "should be false for invalid files" do
      @encrypter.instance_variable_set(:@message, "t.txt")
      expect(@encrypter.check_command_args) == false
    end
  end

  describe "#action" do
    it "#should exit if error occurs" do
      expect { @encrypter.action }.to raise_error(SystemExit)
    end
  end
end
