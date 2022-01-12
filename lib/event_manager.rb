require 'csv'
require 'open-uri'
require 'json'

GOOGLE_CIVIC_API_KEY = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

data = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def legislator_by_zipcode(zipcode)
  url = "https://www.googleapis.com/civicinfo/v2/representatives?address=#{zipcode}&levels=country&roles=legislatorUpperBody&roles=legislatorLowerBody&key=#{GOOGLE_CIVIC_API_KEY}"

  begin
    response = JSON.load(URI.open(url))
    names = response['officials'].map { |i| i['name'] }
    names.join(', ')
  rescue => exception
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

template = File.open('form_letter.html','r').read

until data.eof?
  row = data.readline

  attendee_name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislator_names = legislator_by_zipcode(zipcode)

  puts "#{attendee_name} #{zipcode} #{legislator_names}"

  letter = template
  letter = letter.gsub('FIRST_NAME',attendee_name)
  letter = letter.gsub('LEGISLATORS',legislator_names)

  puts letter
end
