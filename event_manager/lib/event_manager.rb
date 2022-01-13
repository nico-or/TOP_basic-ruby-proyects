require 'csv'
require 'open-uri'
require 'json'
require 'erb'

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
    response['officials']
  rescue => exception
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, letter)
  Dir.mkdir('output') unless Dir.exist?('output')
  File.open("output/thanks_#{id}.html",'w') { |i| i.write(letter) }
end

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

until data.eof?
  row = data.readline

  id = row[0]
  attendee_name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)
end
