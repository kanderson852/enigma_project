require_relative './offset'
require_relative './keys'

class Encrypter
  include Offset
  include Keys
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def offset(date = Date.today)
    {
      'A' => a_offset(date),
      'B' => b_offset(date),
      'C' => c_offset(date),
      'D' => d_offset(date)
    }
  end

  def keys
  end 
end
