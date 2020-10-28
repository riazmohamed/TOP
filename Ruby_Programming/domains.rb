puts "Enter top level domain: "
puts "> "
domain = gets.chomp.downcase

result = case domain
  when "us" then "United States"
  when "de" then "Germany"
  when "sk" then "Slovakia"
  when "hu" then "Hungary"
  else "Unknown"
end

puts result
