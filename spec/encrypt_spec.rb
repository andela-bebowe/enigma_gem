require_relative "spec_helper"

describe Encrypt do

  before :all do
    @encrypter = Encrypt.new
  end

  describe "@encrypter" do

    it "should be an Encrypt obj" do
      expect(@encrypter.class).to be Encrypt
    end
    it "should have an instance of Rotator obj" do
      expect(@encrypter.instance_variable_get(:@rotator).class) == Rotator
    end
    it "should have an instance of FileHandler obj" do
      expect(@encrypter.instance_variable_get(:@file_handler).class) == FileHandler
    end
    it "should have an instance of RotationNumGen obj" do
      expect(@encrypter.instance_variable_get(:@rotation_num_gen).class) == RotationNumGen
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
    it "should be false for invalid files" do
      @encrypter.instance_variable_set(:@message, "t.txt")
      expect(@encrypter.check_command_args) == false
    end

  end

  describe "#encrypt" do

    it "should create a non-empty encrypted file" do
      @encrypter.stub(:encrypt).and_return(File.open("encrypted.txt", "w") { |file| file.write("sedrftvg") })
      @encrypter.encrypt
      expect(File.file? ("encrypted.txt")).to eq true
      expect(File.zero? ("encrypted.txt")).to eq false
    end

  end

  describe "#action" do

    it "#should exit if error occurs" do
      expect { @encrypter.action }.to raise_error(SystemExit)
    end

  end

end