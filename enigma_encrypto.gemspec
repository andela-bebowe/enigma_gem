# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enigma_encrypto/version'

Gem::Specification.new do |spec|
  spec.name          = "enigma_encrypto"
  spec.version       = EnigmaEncrypto::VERSION
  spec.authors       = ["Ebowe Blessing"]
  spec.email         = ["blessing.ebowe@andela.com"]
  spec.summary       = %q{Encrypter, Decrypter and Cracker when you forget your key}
  spec.description   = "Encryption, Decryption and Crack engine."
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["encrypt", "decrypt", "crack"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.required_ruby_version = ">= 2.1"
end
