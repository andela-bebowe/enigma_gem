require_relative "spec_helper"

describe "FileHandler" do
	before :each do
		@filehandler = EnigmaEncrypto::FileHandler.new
		@file1, @file2 = "testfile.txt", "encrypt.txt"
	end

	describe "@filehandler" do
		it "should be a FileHandler obj" do
			expect(@filehandler.class).to be EnigmaEncrypto::FileHandler
		end
	end

	describe "#check_file_useability" do
		it "should return true when the two files are good to go" do
			expect(@filehandler.check_file_useability(@file1, @file2)) == true
		end
		it "should return false if file1 is not eligible for operation" do
			# testfile2.txt is an empty file.
			@file1 = "testfile2.txt"
			expect(@filehandler.check_file_useability(@file1, @file2)) == false
			# unexistent.txt is an unexistent file.
			@file1 = "unexistent.txt"
			expect(@filehandler.check_file_useability(@file1, @file2)) == false
		end
		it "should return an operation if file2 exists." do
			# file to be written to already exists.
			@file2 = "testfile2.txt"
			expect(@filehandler.check_file_useability(@file1, @file2).nil?) == false
		end
	end

	describe "#file_exist_message" do
		it "should not return an empty string" do
			expect(@filehandler.file_exist_message.nil?).to be false
		end
	end

	describe "#operation_collector" do
		it "should collect input from stdin and return corresponding operation" do
			allow(STDIN).to receive(:gets) { 'C' }
			expect(@filehandler.send(:operation_collector)).to eq "c"
		end
		it "should return false for incorrect entry" do
			allow(STDIN).to receive(:gets) { 'q' }
			expect(@filehandler.send(:operation_collector)).to eq false
		end
	end
end
