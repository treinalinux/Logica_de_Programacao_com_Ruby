# frozen_string_literal: true

# https://www.rubyguides.com/2018/10/parse-csv-ruby/
require 'csv'

table = CSV.parse(File.read('arquivo_csv.csv'), headers: true)

puts (table[0]['id']).to_s
