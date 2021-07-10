# frozen_string_literal: true

# example expression regular
# 1:
# /expression/
# 2:
# %r{expression}
# 3:
# Regexp.new('expression')
#

second_phrase = /la/ =~ 'my lamp broke'

first_phrase = 'my lamp broke' =~ /la/

third_phrase = 'my lamp broke'

match_data = /la/.match(third_phrase)

puts first_phrase
puts second_phrase
puts(/la/.match(third_phrase))
puts match_data.pre_match
puts match_data.post_match
puts(/\?/.match('Who is?'))
puts(/[A-Z]lan/.match('Alan, my lamp broke'))
puts(/a\d/.match('Alan, my lamp broke of type a3'))
puts(/a\d{3}/.match('Alan, my lamp broke of type a3456'))
puts(/a\d{2,}/.match('Alan, my lamp broke of type a3456'))
