require_relative './offset'
require_relative './keys'
require_relative 'encrypter.rb'

class Enigma
  attr_reader :encrypter, :decrypter
  include Offset
  include Keys
  def initialize
    @encrypter = Encrypter.new
  end

  def encrypt(message, key = key_finder, date = date_formatter)
    {
      encryption: @encrypter.encrypt(message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt(message, key = key_finder, date = date_formatter)
    {
      decryption: @encrypter.decrypt(message, key, date),
      key: key,
      date: date
    }
  end
end
