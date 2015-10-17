require "coveralls"
Coveralls.wear!
require 'fakefs/spec_helpers'
RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true
end
require_relative "../lib/enigma_encrypto/crack"
require_relative "../lib/enigma_encrypto/dateoffset_gen"
require_relative "../lib/enigma_encrypto/decrypt"
require_relative "../lib/enigma_encrypto/encrypt"
require_relative "../lib/enigma_encrypto/file_handler"
require_relative "../lib/enigma_encrypto/key_gen"
require_relative "../lib/enigma_encrypto/rotator"
require_relative "../lib/enigma_encrypto/rotation_num_gen"
require_relative "../lib/enigma_encrypto/cracker"
require_relative "../lib/enigma_encrypto/serialize"
