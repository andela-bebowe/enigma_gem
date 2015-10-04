module EnigmaEncrypto
  class Serialize

    attr_accessor :key

    def initialize(key)
      @key = key
    end

    def make_all_keys_positive
      @key.map! do |num|
        num = num.to_i
        while num < 0 do
          num += 39
        end
        "%02d" %  num
      end
    end

    def create_original_key_array
      @new_key_array = []
      3.times do |index|
        key_for_next_index = key_getter(@key[index], @key[index + 1])
        @key[index + 1] = key_for_next_index
      end
      @new_key_array << @key[3]
    end

    def make_new_key_string
      new_key_string = ""
      new_key_string << @new_key_array[0][0]
      new_key_string << @new_key_array[1][0]
      new_key_string << @new_key_array[1][1]
      new_key_string << @new_key_array[3][0]
      new_key_string << @new_key_array[3][1]
    end

    def action
      p make_all_keys_positive
      create_original_key_array
      make_new_key_string
    end

    private

      def key_getter(key0, key1)
        @key1 = key1
        @count = 0
        if key0[1] == key1[0]
          @new_key_array << key0
          return key1; end
        while key0[1] != key1[0] do
          key1 = (key1.to_i + 39).to_s
          if key0[1] == key1[0]
            @new_key_array << key0
            return key1
          elsif key1.to_i > 99
            key1 = (@key1.to_i - 39).to_s
            @count += 1
          end
          if @count == 1
            key0 = (key0.to_i + 39).to_s
            @count = 0
          end
        end

      end

  end
end
