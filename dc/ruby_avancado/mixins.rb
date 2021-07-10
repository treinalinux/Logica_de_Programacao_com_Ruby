# frozen_string_literal: true

module ImpressaoDecorada
  def imprimir(text)
    decoracao = '#' * 100
    puts decoracao
    puts text
    puts decoracao
  end
end

module Pernas
  include ImpressaoDecorada
  def chute_frontal
    imprimir 'Chute Frontal'
  end

  def chute_lateral
    imprimir 'Chute Lateral'
  end
end

module Bracos
  include ImpressaoDecorada

  def jab_de_direita
    imprimir 'Jab de direita'
  end

  def jab_de_esquerda
    imprimir 'Jab de esquerda'
  end

  def jab_de_gancho
    imprimir 'Jab de Gancho'
  end
end

class LutadorMuayTai
  include Pernas
  include Bracos
end

class LutadorBoxe
  include Bracos
end

puts 'Allan'
ludador_de_muaytay = LutadorMuayTai.new
ludador_de_muaytay.chute_frontal
ludador_de_muaytay.jab_de_direita
ludador_de_muaytay.jab_de_esquerda

puts 'Alan'
ludador_de_boxe = LutadorBoxe.new
ludador_de_boxe.jab_de_esquerda
ludador_de_boxe.jab_de_direita
ludador_de_boxe.jab_de_esquerda
ludador_de_boxe.jab_de_gancho