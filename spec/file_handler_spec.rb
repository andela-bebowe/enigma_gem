require_relative "spec_helper"

describe "FileHandler", fakefs: true do
	before :each do
		@filehandler = EnigmaEncrypto::FileHandler.new
	end

	describe "@filehandler" do
		it "should be a FileHandler obj" do
			expect(@filehandler.class).to be EnigmaEncrypto::FileHandler
		end
	end

	describe "#check_file_useability" do
		let(:file1){"testfile.txt"}
		let(:content) {"abcd"}
		let(:file2){"encrypt.txt"}
		let(:file_path) { "/spec/my_file_output.txt" }

		it "should return true when the two files are good to go" do
			File.write(file1, content)
			expect(@filehandler.check_file_useability(file1, file2)) == true
		end
		it "should return false if file1 is empty" do
			expect(@filehandler.check_file_useability("empty.txt", file2)) == false
		end
		it "should return invalid_file_message if file is invalid" do
			expect(STDOUT).to receive(:puts).with(@filehandler.invalid_file_message)
			@filehandler.check_file_useability(file1, file2)
		end
		it "should return an operation if file2 exists." do
			stub(:operation_collector).and_return "w"
			expect(@filehandler.check_file_useability(file1, file_path)) == "w"
		end
		it "should return file_exist_message if file2 exists" do
			stub(:puts).with(@filehandler.file_exist_message)
			@filehandler.check_file_useability(file1, file2)
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
