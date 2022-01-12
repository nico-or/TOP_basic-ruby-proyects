require 'csv'

data = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

def clean_phone_number(number)
  number = number.to_s.chars.select{|i| ('0'..'9').include? i }.join

  if number.length == 10 or (number.length == 11 and number[0] == '1')
    return number[-10..]
  end
end

until data.eof?
  row = data.readline

  name = row[:first_name]
  number = row[:homephone]
  puts "#{number.rjust(20)} → #{clean_phone_number(number)}"
end
