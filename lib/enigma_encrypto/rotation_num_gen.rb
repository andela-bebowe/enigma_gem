require_relative "dateoffset_gen"
require_relative "key_gen"

module EnigmaEncrypto
  class RotationNumGen
    attr_accessor :key, :offset, :showkey, :today_date
    
    def initialize
      @key_without_offset = KeyGen.new
      @key = @key_without_offset.initial_rotation_keys
      @showkey = @key_without_offset.display_key
      @offsetgen = DateOffsetGen.new
      @offset = @offsetgen.get_offset
      @today_date = @offsetgen.todays_date
    end

    def rotation_num_array
      rotation_num = []
      4.times do |index|
        rotation_num << @key[index] + @offset[index]
      end
      rotation_num
    end

    def reverse_num_array(key, date)
      @offset = @offsetgen.get_decrypter_offset(date)
      @key = @key_without_offset.initial_decryption_keys(key)
      rotation_num_array
    end

    def crack_num_arr(key, date)
      @key = key
      @offset = date
      rotation_num_array
    end
  end
end
