require './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]
decryption_data = enigma.decrypt(File.read(input).tr("\n", ""), key, date)
File.open(output, "w") do |file|
  file.puts decryption_data[:decryption]
  puts "Created #{output} with the key #{decryption_data[:key]} and date #{decryption_data[:date]}"
end
