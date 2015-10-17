module EnigmaEncrypto
	class FileHandler
		def invalid_file_message
			"File to be read doesnt exist or is empty.\nTry again with an existing file"
		end

		def file_exist_message
			"File to be written to already exists!\n" +
			"To cancel operation, Press 'C'\nTo overwrite File, Type 'W'"
		end

		def check_file_useability(file1, file2)
			if (!(File.exists?file1) || (File.zero? file1))
				puts invalid_file_message
				return false
			end
			if File.exists?file2
				puts file_exist_message
				operation_collector
			end
		end

		def read(filename)
			readable = File.open(filename, "r")
		end

		def writer(filename, word)
			writable = File.open(filename, "a")
			writable.write(word)
			writable.close
		end

		private
			def operation_collector
				operation = ($stdin.gets.chomp).downcase
				if operation != "w" && operation != "c"
					puts "Incorrect Entry"
					operation = false
				end
				return operation
			end
	end
end
