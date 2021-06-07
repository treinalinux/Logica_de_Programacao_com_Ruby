# frozen_string_literal: true

# class Animal
class Animal
  # propriedades - caracteristicas
  attr_accessor :id, :nome, :raca, :tamanho, :velocidade, :cor, :idade

  # metodo de instancia
  def correr; end

  # metodo de instancia
  def falar; end

  # metodo de instancia
  def andar; end

  # metodo de instancia
  def relacionar; end

  # metodo de classe
  def self.todos_os_animais; end

  # metodo de classe
  def self.buscar_animal_por_id(id); end

  # metodo de classe
  def self.buscar_animais_por_nome(nome); end

  def self.salvar_lista(animais); end
end
