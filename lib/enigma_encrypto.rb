require "main_lib_helper.rb"

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
