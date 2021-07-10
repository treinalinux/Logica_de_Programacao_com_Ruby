# frozen_string_literal: true

time = Time.now

puts time
puts time.year
puts time.month
puts time.day

puts time.strftime('%d/%m/%y')
puts time.strftime('%d/%m/%Y')
puts time.saturday?

new_time = Time.now

puts new_time == time
puts new_time != time
puts new_time.year == time.year

