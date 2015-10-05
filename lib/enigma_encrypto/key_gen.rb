module EnigmaEncrypto
  class KeyGen
    attr_accessor :rand_num

    def initialize
      rand = Random.new
      @rand_num = rand(10000..99999).to_s.split("")
    end

    def initial_rotation_keys
      generate_keys
    end

    def display_key
      (@rand_num.map{|num| num.to_i}).join
    end

    def initial_decryption_keys(key)
      @rand_num = key
      generate_keys
    end

    private
      def generate_keys
        key_values = []
        4.times do |index|
          key_values << ((@rand_num[index] + @rand_num[index + 1])).to_i
        end
        key_values
      end
  end
end
