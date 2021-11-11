require_relative './offset'

class Encrypter
  include Offset
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def offset(date = Date.today)
    offset_finder(date)
  end
end
