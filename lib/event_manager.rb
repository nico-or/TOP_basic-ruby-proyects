require 'csv'

data = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

until data.eof?
  zipcode = data.readline[:zipcode]
  puts "#{zipcode.to_s.rjust(10)} → #{clean_zipcode(zipcode)}"
end
