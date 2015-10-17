require_relative "rotation_num_gen"
require_relative "rotator"

module EnigmaEncrypto
  class Cracker
    def initialize(file, length, offset)
      @offset = offset
      @file = file
      @length = length
      @character_map = Rotator.new.character_map_creation
    end

    def locate_position_to_start_crack
      seek_pt = @length % 4
      @file.seek(@length - (4 + seek_pt))
      @end_index = 3 - seek_pt
    end

    def needed_four_of_file
      @text_arr = []
      4.times do
        @text_arr << @file.getc
      end
      @text_arr.map!{|letter| @character_map.index(letter)}
    end

    def the_end_arr
      @end_arr = [".", ".", "e", "n", "d", ".", "."]
      @end_arr.map!{|letter| @character_map.index(letter)}
    end

    def creating_key
      key_arr = []
      4.times do |index|
        key_arr << @text_arr[index] - @offset[index] - @end_arr[@end_index]
        @end_index += 1
      end
      key_arr
    end

    def get_key
      locate_position_to_start_crack
      needed_four_of_file
      the_end_arr
      creating_key
    end
  end
end
