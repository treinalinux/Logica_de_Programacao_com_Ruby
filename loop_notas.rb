# frozen_string_literal: true

system('clear')

notas = []
ano_letivo = true

print 'Informe o nome do estudante: '
estudante = gets.chomp.strip

while ano_letivo == true
  system('clear')
  puts "--- Notas tiradas por #{estudante}."
  puts "Total: #{notas}"
  print "\nQual nota tirada por #{estudante}: "
  nota = gets.chomp

  puts nota
  break if nota == '-1'

  notas << nota.to_f
  print 'O ano letivo em progresso ? [S/N] '
  ano_letivo = gets.upcase.strip == 'S'
end

fim_ano_letivo = notas.sum / notas.length

if fim_ano_letivo >= 8
  puts "\nParabéns, passou com uma média de #{fim_ano_letivo}"
else
  puts "\nQue pena, ficou abaixo da média aprovação com #{fim_ano_letivo}"
end

puts '--- fim ---'
