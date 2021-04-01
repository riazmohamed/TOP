require 'csv'

def clean_zipcode(zipcode)
  if zipcode.length > 5
    zipcode.slice(0, 5)
  else
    zipcode = ("00000" + zipcode).slice(-5, 5)
  end
end

puts "Event Manager Initialized!"

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode].to_s)
  puts "#{name} #{zipcode}"
end
