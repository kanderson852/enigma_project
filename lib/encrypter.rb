require_relative './offset'
require_relative './keys'

class Encrypter
  include Offset
  include Keys
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def shifts(date = Date.today, keys)
    offset(date).merge(keys){|key, offset, keys| offset.to_i + keys.to_i}
  end
end
