require_relative "spec_helper"

describe Decrypt do

  before :all do
    @decrypter = Decrypt.new
  end

  describe "@decrypter" do

    it "should be an Decrypt obj" do
      expect(@decrypter.class).to be Decrypt
    end
    it "should have an instance of Rotator obj" do
      expect(@decrypter.instance_variable_get(:@rotator).class) == Rotator
    end
    it "should have an instance of FileHandler obj" do
      expect(@decrypter.instance_variable_get(:@file_handler).class) == FileHandler
    end
    it "should have an instance of RotationNumGen obj" do
      expect(@decrypter.instance_variable_get(:@rotation_num_gen).class) == RotationNumGen
    end

  end

  describe "#methods" do
    
    before :all do
      @decrypter.instance_variable_set(:@encrypted, "encrypted.txt")
      @decrypter.instance_variable_set(:@decrypted, "decrypted.txt")
      @decrypter.instance_variable_set(:@key, "12345")
      @decrypter.instance_variable_set(:@date, "300915")
    end

    describe "#get_command_args" do

      it "should be false for incorrect number of argument" do
        expect(@decrypter.get_command_args).to eql false
      end

    end

    describe "#check_command_args" do

      it "should return true for valid files" do
        expect(@decrypter.check_command_args) == true
      end
      it "should be false for invalid files" do
        @decrypter.instance_variable_set(:@encrypted, "t.txt")
        expect(@decrypter.check_command_args) == false
      end

    end

    describe "#action" do
      it "#should exit if error occurs" do
        expect { @decrypter.action }.to raise_error(SystemExit)
      end
    end

  end

end