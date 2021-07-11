# frozen_string_literal: true

require 'net/http'

req = Net::HTTP::Post.new('/api/users')
req.set_form_data({ name: 'Alan', job: 'Developer' })

# for call web https
response = Net::HTTP.start('reqres.in', use_ssl: true) do |http|
  http.request(req)
end

# status code
puts response.code

# body (json)
puts response.body
