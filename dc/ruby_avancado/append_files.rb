# frozen_string_literal: true

# append
File.open('list.txt', 'a') do |line|
  line.puts('rice')
  line.puts('bean')
  line.puts('olive oil')
end
