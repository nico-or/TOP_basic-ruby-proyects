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

#until data.eof?
#  row = data.readline

#  name = row[:first_name]
#  number = row[:homephone]
  #puts "#{number.rjust(20)} → #{clean_phone_number(number)}"
#end

#data.rewind

def parse_date(date)
  DateTime.strptime(date, '%m/%d/%y %H:%M')
end

regdates = data.readlines.map { |i| parse_date(i[:regdate]) }


#reg_day_count = Hash.new(0)
#reg_hour_count = Hash.new(0)
#regdates.each do |date|
#  reg_day_count[date.wday] += 1
#  reg_hour_count[date.hour] += 1
#end

def frequency_counter(array, &block)
  array.map {|i| block.call(i) }.
  group_by(&:itself).
  each_with_object({}) { |(k,v),h| h[k] = v.size }
end

reg_hour_count = frequency_counter(regdates) {|i| i.hour}
reg_day_count = frequency_counter(regdates) {|i| i.wday }

# ordered by key
freq_hour_sorted = reg_hour_count.to_a.sort { |a,b| a[0] <=> b[0] }
freq_day_sorted = reg_day_count.to_a.sort { |a,b| a[0] <=> b[0] }

freq_hour_sorted.each {|hour, freq| puts "Hour: #{hour} Freq: #{freq}"}
puts "Most Frequent hour: #{freq_hour_sorted.sort{|a,b|a[1]<=>b[1]}.last[0]}"

puts " "

freq_day_sorted.each {|i, freq| puts "Day: #{Date::DAYNAMES[i]} Freq: #{freq}"}
puts "Most Frequent day: #{Date::DAYNAMES[freq_day_sorted.sort{|a,b|a[1]<=>b[1]}.last[0]]}"
