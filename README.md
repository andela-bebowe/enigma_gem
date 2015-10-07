# EnigmaEncrypto [![Coverage Status](https://coveralls.io/repos/andela-bebowe/enigma_gem/badge.svg?branch=temp&service=github)](https://coveralls.io/github/andela-bebowe/enigma_gem?branch=temp)

The EnigmaEncrypto gem is an encryption engine for encoding messages. It is built using the Ruby programming language and intended to be used from within the command line.


ENIGMA entails creation of an Ecryptor gem like the Ceasar cipher.
Contains encrypt ruby file that when called with two file names as command line arguments, it encrypts the first file and saves in the other.
Also contains decrypt ruby file that when called with two file names, date of creation and a key as command line arguments, it encrypts the first file and saves in the other.
Also includes a little twist where you can actually crack an encrypted file without a key.

## How the encryption works

The encryption is based on rotation of letters based on a a key and the date that message was generated. The character map is made up of alphanumeric characters (alphabets all in lowercase), space character, period character and the comma character.

### The Key

* Each message uses a unique encryption key
* The key is five digits, like 41521
* The first two digits of the key are the "A" rotation (41)
* The second and third digits of the key are the "B" rotation (15)
* The third and fourth digits of the key are the "C" rotation (52)
* The fourth and fifth digits of the key are the "D" rotation (21)

### The Offset

* The date of message transmission is also factored into the encryption
* Consider the date in the format DDMMYY, like 020315
* Square the numeric form (412699225) and find the last four digits (9225)
* The first digit is the "A offset" (9)
* The second digit is the "B offset" (2)
* The third digit is the "C offset" (2)
* The fourth digit is the "D offset" (5)

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

To use add the directory of the bin folder of this gem to your Systems Path/Environment variables.
You can then call `encrypt`, `decrypt` or `crack`, on the file you want to work on, and also with a destination file name.
File to be encrypted, decrypted or cracked must be in your working directory.

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
