require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: "country",
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')
  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

# the following are the conditions for a clean phone number
  # if the number length is less than 10 then the number is a bad number
  # number.length == 10 then a good number
  # number.length == 11 and the first num == '1' then select last 10 num

  # number.length > 10 and the first num != '1' then bad number



def clean_phone_number(number)
  phone_number = number
  phone_number.gsub!(/[^\d]/, "")
  phone_number = "Invalid Number!" if phone_number.length < 10
  if phone_number.length >= 11
    if phone_number[0] == '1' && phone_number.length == 11
      phone_number = phone_number[1..10]
    else
      phone_number = "Invalid Number!"
    end
  end
  phone_number
end

puts "Event Manager Initialized!"

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new(template_letter)

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)

  phone_number = clean_phone_number(row[:homephone])
  puts "Name:#{name} homephone: #{phone_number}"
end
