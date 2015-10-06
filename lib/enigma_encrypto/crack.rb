require_relative "lib_helper"

module EnigmaEncrypto
  class Crack
    def initialize
      @file_handler = FileHandler.new
      @rotator = Rotator.new
      @rotation_num_gen = RotationNumGen.new
    end

    def get_command_args
      if ARGV.length != 3
        puts "Oooops!\nIncorrect number of arguments supplied.\nTry again."
        false
      else
        @encrypted = ARGV[0]
        @cracked = ARGV[1]
        @date = ARGV[2]
      end
    end

    def check_command_args
      if ("%06d" % (@date.to_i)).size != 6 || @date.to_i <= 0
        puts "Incorrect date entered"
        return false
      end
      operation = @file_handler.check_file_useability(@encrypted, @cracked)
      return false if operation == false || operation == "c"
      File.truncate(@cracked, 0) if operation == "w"
      true
    end

    def get_crack_key
      @opened_encrypted = @file_handler.read(@encrypted)
      @length = @opened_encrypted.size
      @offset = DateOffsetGen.new.get_decrypter_offset(@date)
      @key = Cracker.new(@opened_encrypted, @length, @offset).get_key
    end

    def crack    
      @reverse_array = @rotation_num_gen.crack_num_arr(@key, @offset)
      @opened_encrypted.rewind
      crack_encrypted
      @opened_encrypted.close
    end

    def action
      exit if !get_command_args
      exit if !check_command_args
      get_crack_key
      crack
      @key.map!{|digit| "%d" % digit }
      @key = Serialize.new(@key).action
      puts "Cracked #{@encrypted} and created #{@cracked} with key #{@key} and date #{@date}."
      true
    end
    
    private
      def crack_encrypted
        reverse_array_index = 0
        while @length > 0
          character_in_encry = @opened_encrypted.getc
          reverse_encrypted(character_in_encry, reverse_array_index)
          reverse_array_index += 1
          reverse_array_index = 0 if reverse_array_index == 4
          @length -= 1
        end
      end

      def reverse_encrypted(character, index)
        cracked_char = @rotator.reverse_text(character, @reverse_array[index])
        @file_handler.writer(@cracked, cracked_char)
      end
  end
end
