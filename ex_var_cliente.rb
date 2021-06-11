# Cliente: Joao
# Pedido:
# Software que faca o calculo da porcentagem de desconto,
# a porcentagem sera sobre o valor total
# Deve receber o valor total e a porcentagem,
# e devolver o resultado com desconto

system('clear')

puts '---------------------------'
print 'Informe o valor total: '
valor_total = gets.to_f
print 'Informe a porcentagem: '
porcentagem_desconto = gets.to_f
puts '---------------------------'

valor_desconto = valor_total * porcentagem_desconto / 100
valor_total_com_desconto = valor_total - valor_desconto

puts "O valr a pagar com base no valor total #{valor_total} é:\n R$ #{valor_total_com_desconto}"
