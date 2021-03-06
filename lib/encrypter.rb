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
    message_characters = message.downcase.split('')
    special_character = Hash.new(0)
    message_index = []
    message_characters.each do |message_character|
      if !@character_set.include?(message_character)
        special_character[message_character] = message.index(message_character)
      elsif @character_set.include?(message_character)
        message_index << @character_set.index(message_character)
      end
    end
    message_index = message_index.each_slice(4).to_a
    new_message_shift = []
    transformer = message_index.map do |array|
      Hash[shift.values.zip(array)]
    end.map do |hash|
      hash.compact.each_pair do |shift, index|
        new_message_shift << shift + index
      end
    end
     encrypter = new_message_shift.map do |index|
      @character_set.rotate(index)
    end
    new_message = encrypter.map do |letter|
      letter[0]
    end.inject(:+)
    if special_character == {}
      final_message = new_message
    else
      final_message = special_character.each_pair do |character, index|
        new_message.insert(index, character)
      end
      new_message
    end
  end

  def decrypt(message, key = key_finder, date = date_formatter)
    shift = shifts(date, key)
    message_characters = message.downcase.split('')
    special_character = Hash.new(0)
    message_index = []
    message_characters.each do |message_character|
      if !@character_set.include?(message_character)
        special_character[message_character] = message.index(message_character)
      elsif @character_set.include?(message_character)
        message_index << @character_set.index(message_character)
      end
    end
    message_index = message_index.each_slice(4).to_a
    new_message_shift = []
    transformer = message_index.map do |array|
      Hash[shift.values.zip(array)]
    end.map do |hash|
      hash.compact.each_pair do |shift, index|
        new_message_shift << shift - index
      end
    end
     encrypter = new_message_shift.map do |index|
      @character_set.reverse.rotate(index - 1)
    end
    new_message = encrypter.map do |letter|
      letter[0]
    end.inject(:+)
    if special_character == {}
      final_message = new_message
    else
      final_message = special_character.each_pair do |character, index|
        new_message.insert(index, character)
      end
      new_message
    end
  end
end
