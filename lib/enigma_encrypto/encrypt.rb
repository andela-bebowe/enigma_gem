require_relative "lib_helper"

module EnigmaEncrypto
  class Encrypt
    def initialize
      @file_handler = FileHandler.new
      @rotator = Rotator.new
      @rotation_num_gen = RotationNumGen.new
    end

    def get_command_args
      if ARGV.length != 2
        puts "Oooops!\nIncorrect number of arguments supplied.\nTry again."
        false
      else
        @message = ARGV[0]
        @encrypted = ARGV[1]
      end
    end

    def check_command_args
      operation = @file_handler.check_file_useability(@message, @encrypted)
      return false if operation == false || operation == "c"
      File.truncate(@encrypted, 0) if operation == "w"
      true
    end

    def encrypt
      @opened_msg = @file_handler.read(@message)
      length = @opened_msg.size
      encrypt_message(length)
      @opened_msg.close
    end

    def action
      exit if !get_command_args
      exit if !check_command_args
      encrypt
      key = @rotation_num_gen.showkey
      date = @rotation_num_gen.today_date
      puts "Created #{@encrypted} with the key #{key} and date #{date}"
      true
    end

    private
      def encrypt_message(length)
        rotation_num_index = 0
        while length > 0
          character_in_msg = @opened_msg.getc
          rotate_msg(character_in_msg, rotation_num_index)
          rotation_num_index += 1
          rotation_num_index = 0 if rotation_num_index == 4
          length -= 1
        end
        @file_handler.writer(@encrypted, @rotated_char)
      end

      def rotate_msg(character, index)
        @rotated_char = ""
        @rotation = @rotation_num_gen.rotation_num_array
        @rotated_char += @rotator.rotate_text(character, @rotation[index])
      end
  end
end
