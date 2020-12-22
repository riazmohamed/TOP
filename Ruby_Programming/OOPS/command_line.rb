ARGV.each do |a|
  puts "Argument: #{a}"
end

p ARGV

# when run the following command
# ruby command_line.rb 1 2 3 4 5

# => 
# Argument: 1
# Argument: 2
# Argument: 3
# Argument: 4
# Argument: 5
# ["1", "2", "3", "4", "5"]
