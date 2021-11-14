require './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
key = '1234'
date = '111421'
encryption_data = enigma.encrypt(File.read(input).tr("\n", ""), key, date)
File.open(output, "w") do |file|
  file.puts encryption_data[:encryption]
  puts "Created #{output} with the key #{encryption_data[:key]} and date #{encryption_data[:date]}"
end
