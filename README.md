# EnigmaEncrypto

This is my first checkpoint project done under the Andela Institute curriculum titled ENIGMA.

ENIGMA entails creation of an Ecryptor gem like the Ceasar cipher.
Contains encrypt ruby file that when called with two file names as command line arguments, it encrypts the first file and saves in the other.
Also contains decrypt ruby file that when called with two file names, date of creation and a key as command line arguments, it encrypts the first file and saves in the other.
Also includes a little twist where you can actually crack an encrypted file without a key.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enigma_encrypto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enigma_encrypto

## Usage

To use add the directory to the bin folder of this gem to your Systems Path/Environment variables.
You can then call "encrypt/decrypt/crack", on the file you want to work on, and also with a destination file name.
File to be encrypted/decrypted/cracked must be in your working directory.

Example: To call encrypt on a message.txt file in my desktop folder

$ cd desktop
$ encrypt message.txt encrypted.txt
=>#Created encrypted.txt with the key 12345 and date 300815

You can also write the absolute path of the file if you dont want to change working directory.

$ encrypt desktop/message.txt encrypted.txt

## Contributing

1. Fork it ( https://github.com/[andela-bebowe]/enigma_gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
