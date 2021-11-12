require_relative './offset'
require_relative './keys'

class Encrypter
  include Offset
  include Keys
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def shifts(date = date_formatter, key = key_finder)
    offset(date).merge(key_hash(key)){|letter, offset, keys| offset.to_i + keys.to_i}
  end

  def encrypt(message, key = key_finder, date = date_formatter)
    shift = shifts(date, key)
    require "pry"; binding.pry
    {
      encryption: message,
      key: key,
      date: date
    }
  end
end
