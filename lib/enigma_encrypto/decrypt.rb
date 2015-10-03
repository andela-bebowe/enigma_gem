require_relative "lib_helper"

module EnigmaEncrypto
  
  class Decrypt

    def initialize
      @file_handler = FileHandler.new
      @rotator = Rotator.new
      @rotation_num_gen = RotationNumGen.new
    end

    def get_command_args
      if ARGV.length != 4
        puts "Oooops!\nIncorrect number of arguments supplied.\nTry again."
        return false
      else
        @encrypted = ARGV[0]
        @decrypted = ARGV[1]
        @key = ARGV[2]
        @date = ARGV[3]
      end
    end

    def check_command_args
      if ("%05d" % (@key.to_i)).size != 5 || ("%06d" % (@date.to_i)).size != 6
        puts "Incorrect key or date entered"
        return false; end
      operation = @file_handler.check_file_useability(@encrypted, @decrypted)
      return false if operation == false || operation == "c"
      File.truncate(@decrypted, 0) if operation == "w"
      true
    end

    def decrypt
      @reverse_array = @rotation_num_gen.reverse_num_array(@key, @date)
      @opened_msg = @file_handler.read(@encrypted)
      length = @opened_msg.size
      decrypt_message(length)
      @opened_msg.close
    end

    def action
      exit if !get_command_args
      exit if !check_command_args
      decrypt
      puts "Decrypted #{@decrypted} with the key #{@key} and date #{@date}"
    end

    private

      def decrypt_message(length)
        reverse_num_index = 0
        while length > 0
          character_in_msg = @opened_msg.getc
          reverse_msg(character_in_msg, reverse_num_index)
          reverse_num_index += 1
          reverse_num_index = 0 if reverse_num_index == 4
          length -= 1
        end
      end

      def reverse_msg(character, index)
        reversed_char = @rotator.reverse_text(character, @reverse_array[index])
        @file_handler.writer(@decrypted, reversed_char)
      end

  end

end
  # d = Decrypt.new
  # d.action