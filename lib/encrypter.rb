require_relative './offset'

class Encrypter
  include Offset
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
end
