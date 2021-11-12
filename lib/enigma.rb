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
    @encrypter.encrypt(message, key, date)
  end

  def decrypt(message, key, date)
    {}
  end
end
