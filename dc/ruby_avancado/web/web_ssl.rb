# frozen_string_literal: true

require 'net/http'

https = Net::HTTP.new('reqres.in', 443)

# for call web https
https.use_ssl = true

response = https.get('/api/users')

# status code
puts response.code

# status message
puts response.message

# body (json)
puts response.body
