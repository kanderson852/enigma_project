message = File.open("message.txt", 'r')
encrypted = File.open('encrypted.txt', "w")
message.read
message.rewind
a = message.readlines
encrypted.write(a)
encrypted.close
message.close
# require "pry"; binding.pry
ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"
puts "Created 'encrypted.txt' with the key 82648 and date 240818"
