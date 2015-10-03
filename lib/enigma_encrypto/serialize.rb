module EnigmaEncrypto
  
  class Serialize
    attr_accessor :key

    def initialize(key)
      @key = key
    end
    def serial
      @key.map! do |num|
        num = num.to_i
        num += 39 if num < 0
        "%02d" %  num
      end
    end

    def key_caller
      str = key_setter(@key[0], @key[1])
      key2 = @key[2]
      key3 = @key[3]
      while str[1] != key2[0]
        key2 = (key2.to_i + 39).to_s
      end
      key2 = "%02d" % key2
      str << key2[0]
      str << key2[1]
      str
    end

    def key_setter(key0, key1)
      @key1 = key1
      count = 0
      while key0[1] != key1[0]
        key1 = (key1.to_i + 39).to_s
        if key0[1] == key1[0]
          string_key = key0.split("")
          break
        elsif key1.to_i > 99
          key1 = (@key1.to_i - 39).to_s
          count += 1
        end
        if count == 1
          key0 = (key0.to_i + 39).to_s
        end
      end
      string_key
    end

  end
end
  # s = Serialize.new(["19", "18", "29", "-30"])
  # p s.serial
  # p s.key_caller