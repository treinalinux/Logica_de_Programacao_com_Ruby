# frozen_string_literal: true

system('clear')

# class Colaborador
class Colaborador
  attr_accessor :nome, :sobrenome, :cpf, :vacinado

  # metodo de class por causa do self, se retorna para varios entao eh de class sendo estatico
  def self.buscar_por_cpf(cpf)
    # colaborador_encontrado = nil
    # ControladorVacina.colaboradores.each do |colaborador|
    #   if colaborador.cpf == cpf
    #     colaborador_encontrado = colaborador
    #     break
    #   end
    # end
    #
    # colaborador_encontrado
    ControladorVacina.colaboradores.find { |colaborador| colaborador.cpf == cpf }
  end

  # metodo de instancia
  def mostrar
    puts ''
    puts "----- Nome:\t\t #{@nome}"
    puts "----- Sobrenome:\t #{@sobrenome}"
    puts "----- CPF:\t\t #{@cpf}"
    puts "----- Vacinado(a):\t #{@vacinado ? 'Sim' : 'Não'}"
    puts '==========================================================='
    ControladorVacina.pausa(5)
  end
end

# class ControladorVacina
class ControladorVacina
  # global no contexto
  @@colaboradores = []
  SAIR_DO_SISTEMA = 4

  def self.colaboradores
    @@colaboradores
  end

  def self.menu
    puts "\n Total de vacinados: #{ControladorVacina.colaboradores.count}"
    puts '...........................'
    puts "\n O que deseja fazer? \n\n"
    puts ' (1) Cadastrar colaborador'
    puts ' (2) Localizar colaborador'
    puts ' (3) Listar colaboradores'
    puts ' (4) Sair'
    puts '...........................'
    print "\n Seleciona uma opção: "
    captura_item_menu
  end

  def self.captura_item_menu
    opcao = gets.to_i
    case opcao
    when 1
      system('clear')
      ControladorVacina.cadastrar_colaborador
    when 2
      system('clear')
      ControladorVacina.buscar_colaborador
    when 3
      ControladorVacina.listar_colaboradores
    when SAIR_DO_SISTEMA
      SAIR_DO_SISTEMA
    end
  end

  def self.incluir_colaborador(cpf)
    colaborador = Colaborador.new
    colaborador.cpf = cpf
    print '- Nome do colaborador(a): '
    colaborador.nome = gets.strip
    print '- Sobrenome do colaborador(a): '
    colaborador.sobrenome = gets.strip
    colaborador.vacinado = true

    ControladorVacina.colaboradores << colaborador
    colaborador.mostrar
  end

  def self.cadastrar_colaborador
    print 'Digite o CPF do colaborador: '
    cpf = gets.strip
    colaborador = Colaborador.buscar_por_cpf(cpf)

    if colaborador.nil?
      ControladorVacina.incluir_colaborador(cpf)
    else
      puts "Colaborador do cpf #{cpf} já foi vacinado!"
      colaborador.mostrar
    end
  end

  def self.buscar_colaborador
    print 'Digite o CPF do colaborador: '
    cpf = gets.strip
    colaborador = Colaborador.buscar_por_cpf(cpf)

    if colaborador.nil?
      print " CPF #{cpf} não encontrado! Deseja cadastrar o mesmo? (S/N): "
      opcao = gets.strip.upcase
      ControladorVacina.incluir_colaborador(cpf) if opcao == 'S'
    else
      colaborador.mostrar
    end
  end

  def self.listar_colaboradores
    system('clear')
    if ControladorVacina.colaboradores.length.zero?
      puts ' Nenhum colaborador(a) vacinado em nossa base.'
      puts '==========================================================='
      ControladorVacina.pausa
      return
    end
    ControladorVacina.colaboradores.each(&:mostrar)
  end

  def self.pausa(tempo=2)
    sleep(tempo)
    system('clear')
  end

  # self.init
  def self.init
    system('clear')
    loop do
      opcao = ControladorVacina.menu
      break if opcao == SAIR_DO_SISTEMA
    end
  end
end

ControladorVacina.init
