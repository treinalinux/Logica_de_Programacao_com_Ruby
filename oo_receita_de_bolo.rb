# frozen_string_literal: true

system('clear')

# class receita de Bolo
class Bolo
  # constructor method
  def initialize(nome = nil)
    @nome = nome
  end

  attr_accessor :nome, :cor, :especial

  # instance method
  def cozinhar
    puts "- #{nome} está cozinhando..."
  end

  # class method
  def self.cozinhar_todos(bolos)
    bolos.each do |bolo|
      puts "- #{bolo.nome} está cozinhando..."
    end
  end
end

Bolo.new('Bolo de chocolte').cozinhar

puts '----------------------------------------'

Bolo.cozinhar_todos([
                      Bolo.new('Bolo de coco'),
                      Bolo.new('Bolo de morango'),
                      Bolo.new('Bolo de milho'),
                      Bolo.new('Bolo de limão')
                    ])
