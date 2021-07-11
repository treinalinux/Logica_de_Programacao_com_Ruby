# frozen_string_literal: true

require 'nokogiri'
require 'net/http'

https = Net::HTTP.new('onebitcode.com', 443)

# for call web https
https.use_ssl = true

response = https.get('/')

doc = Nokogiri::HTML(response.body)

h1 = doc.at('h1')

puts h1.content

last_post = doc.at('h3 a')
puts last_post.content
puts last_post['href']

# find all posts on page first
doc.search('h3 a').each do |a|
  puts a.content
  puts a['href']
  puts ''
end
