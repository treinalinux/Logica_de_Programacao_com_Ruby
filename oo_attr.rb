# frozen_string_literal: true

# class Aluno
class Aluno
  # getter e setter
  attr_accessor :nome, :matricula, :notas

  def estudar
    # puts "Nome #{self.nome}"
    puts "Nome:\t\t #{@nome}"
    puts "Matricula:\t #{@matricula}"
    puts "Notas:\t\t #{@notas}"
  end
end

alan = Aluno.new
alan.nome = 'Alan da Silva Alves'
alan.matricula = '0002021'
alan.notas = [8, 9, 7, 10]

alan.estudar

puts '------------------------'

carla = Aluno.new
carla.nome = 'Carla Fernanda Alves'
carla.matricula = '0002023'
carla.notas = [10, 9, 10, 10]

carla.estudar
