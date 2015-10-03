module EnigmaEncrypto
 
  class Rotator
    def character_map_creation
      @character_map = []
      @character_map.concat(("a".."z").to_a)
      @character_map.concat(("0".."9").to_a)
      @character_map.concat([" ", ".", ","])
    end
    def rotator(rotation)
      character_map_creation
      rotated_character_map = @character_map.rotate(rotation)
      Hash[@character_map.zip(rotated_character_map)]
    end
    def rotate_text(text, rotation)
      rotation_for_text = rotator(rotation)
      rotation_for_text[text]
    end
    def reverse_text(text, reversion)
      reversion = 0 - reversion
      rotate_text(text, reversion)
    end
  end
end