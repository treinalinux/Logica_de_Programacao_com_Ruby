# frozen_string_literal: true

require 'byebug'

# Sistema de Padaria - Mudar no futuro
# Cliente: Joao
# Pedido:
# Software que faca o calculo da porcentagem de desconto,
# a porcentagem sera sobre o valor total
# Deve receber o valor total e a porcentagem,
# e devolver o resultado com desconto

system('clear')

debugger

puts '---------------------------'
print 'Informe o valor total: '
valor_total = gets.to_f
print 'Informe a porcentagem: '
porcentagem_desconto = gets.to_f
puts '---------------------------'

valor_desconto = valor_total * porcentagem_desconto / 100
valor_total_com_desconto = valor_total - valor_desconto

## ifs
acresimo_no_valor = 0

if valor_total_com_desconto < 10
  print 'Gostaria de incluir um item a mais? [S/N]: '
  decisao_do_cliente = gets.chomp
  acresimo_no_valor = 15 if decisao_do_cliente.to_s.upcase.strip == 'S'
end

valor_total_com_desconto += acresimo_no_valor
puts "O valr a pagar com base no valor total #{valor_total} é:\n R$ #{valor_total_com_desconto}"

## Mudar no futuro usando a ideia base
