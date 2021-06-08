# frozen_string_literal: true

# class Country, exemplo Brasil, EUA
# Country foi adicionada depois, o ruby nao tem heranca multipla, por isso
# Leia comecando pela class Pessoa
class Country
  def capital
    puts 'Brasilia'
  end
end

# class Pessoa - eh a classe pai de Fisica e de Juridica
class Pessoa < Country
  # metodo construtor initialize
  def initialize
    @nome = 'Alan'
    @email = 'linux@linux'
    # o super aqui foi criado depois
    super
  end
  attr_accessor :nome, :email
end

# class Fisica - eh a classe filha que herda da classe pai Pessoa
class Fisica < Pessoa
  # Aqui o metodo construtor initialize, vai sobreescrever o valor recebido de Pessoa
  # Isso quer dizer que nome e email nao sera mostrado.
  # Esse processo de sobreescrever eh chamado de POLIMORFISMO, entenda que mesmo se
  # nao tivesse quaisquer proprieadades no initialize, mas da classe Fisica, mas
  # o construtor tivesse sido criado vazio, iria sobreescrever o que viesse da classe Pessoa
  def initialize
    @cpf = '111.222.337-02'
    @sobrenome = 'Alves'
    @rg = '11.222.123-4'
    # usamos o super para mostrar as proprieadades da class Pessoa
    # a funcao do super eh chamar o metodo pai, nesse caso a classe Pessoa
    super
  end
  attr_accessor :cpf, :sobrenome, :rg
end

# class Juridica - eh a classe filha que herda da classe pai Pessoa
class Juridica < Pessoa
  def initialize
    @cnpj = '11.222/03-04'
    @nome_fantasia = 'Fantasia tech - ltd'
    @inscricao_estadual = 'BSB54321'
    super
  end
  attr_accessor :cnpj, :nome_fantasia, :inscricao_estadual
end

puts Pessoa.new.inspect
puts '----------------------'
puts Fisica.new.inspect
puts '----------------------'
puts Juridica.new.inspect
puts '----------------------'
puts 'O que for = eh um setter, os demais sao getter:'
puts Fisica.new.methods - Class.methods
