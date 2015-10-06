module EnigmaEncrypto
  class FileHandler
    #file1 represents file to be read from
    #file2 represents file to be written to

    def messages
      @msg1 = "File to be read doesnt exist or is empty.\nTry again with an existing file"
      @msg2 = "File to be written to already exists!"
      @msg3 = "To cancel operation, Press 'C'\nTo overwrite File, Type 'W'"
      @msg4 = "Incorrect Entry"
    end

    def check_file_useability(file1, file2)
      messages
      if (!(File.exists?file1) || (File.zero? file1))
        puts @msg1
        return false
      end 
      if File.exists?file2
        puts @msg2 + "\n" + @msg3
        operation_collector
      end
    end

    def read(msg)
      readable = File.open(msg, "r")
    end

    def writer(msg, word)
      writable = File.open(msg, "a")
      writable.write(word)
      writable.close
    end

    private

      def operation_collector
        operation = ($stdin.gets.chomp).downcase
        if operation != "w" && operation != "c"
          puts @msg4
          operation = false
        end
        return operation
      end 
  end
end
