require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb' # ERB library
require 'time'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

    begin
      civic_info.representative_info_by_address(
        address: zip,
        levels: 'country',
        roles: ['legislatorUpperBody', 'legislatorLowerBody']
      ).officials
    rescue
      'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(number)
  phone_number = number
  phone_number.gsub!(/[\D]/,"")

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

def time_format(date)
  Time.strptime(date, "%m/%d/%y %k:%M")
end

puts 'EventManager initialized.'

am_registry = []
pm_registry = []
day_registry = {}
hour_registry = {}

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)

  phone_number = clean_phone_number(row[:homephone])

  time = time_format(row[:regdate])
  registered = time.strftime("%I:%M %P")
  entry_day = time.strftime("%A")
  puts "#{name} registered at: #{registered} on #{entry_day}"

  registered_time = time.strftime("%k:%M")
  if hour_registry.has_key?(time.strftime("%k"))
    hour_registry[time.strftime("%k")] += 1
  else
    hour_registry[time.strftime("%k")] = 1
  end

  pm_registry << time.strftime("%I:%M") if time.strftime("%P") == 'pm'
  am_registry << time.strftime("%I:%M") if time.strftime("%P") == 'am'

  if day_registry.has_key?(entry_day)
    day_registry[entry_day] += 1
  else
    day_registry[entry_day] = 1
  end

end

p "entries before 12pm: #{am_registry.count}"
p "entries after 12pm: #{pm_registry.count}"
am_registry.sort
pm_registry.sort

max_hour = hour_registry.values.max
max_hour_sign_up = hour_registry.select { |k, v| v == max_hour }


max_value = day_registry.values.max
max_day = day_registry.find { |k, v| v == max_value }.first

max_hour_sign_up.each do |k, v|
  puts "Most people registered: #{v}, between hours #{k}:00 -#{k.to_i + 1}:00. "
end

puts "#{max_value} people registered on a '#{max_day}' which was the most common day for registrations in a week."
