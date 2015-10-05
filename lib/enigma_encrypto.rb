require "enigma_encrypto/version"
require "enigma_encrypto/crack"
require "enigma_encrypto/encrypt"
require "enigma_encrypto/decrypt"

module EnigmaEncrypto
  def self.encrypt
    encrypto = EnigmaEncrypto::Encrypt.new
    encrypto.action
  end

  def self.decrypt
    decrypto = EnigmaEncrypto::Decrypt.new
    decrypto.action
  end
  
  def self.crack
    cracko = EnigmaEncrypto::Crack.new
    cracko.action
  end
end
