#### **Blocks**

Um bloco pode ser entendido como uma função anônima, ou seja, uma função sem nome. É definido entre **do**..**end**  ou **colchetes** e da mesma forma que os métodos que você viu até agora, pode receber parâmetros para sua execução.



Use **colchetes **para escrever blocos que ocupam apenas uma linha.

1- Em um arquivo chamado **block.rb** adicione o seguinte código:

```
5.times { puts "Exec the block" }
```

2- Utilize barras verticais para passar parâmetros para um bloco

```
sum = 0
numbers = [5, 10, 5]
numbers.each {|number| sum += number }
puts sum
```

3- Em blocos que ocupam várias linhas, faça uso do **do..end**

```
foo = {2 => 3, 4 => 5}

foo.each do |key, value|
  puts "key = #{key}"
  puts "value = #{value}"
  puts "key * value = #{key * value}"
  puts '---'
end
```

4- Um bloco pode ser passado como  argumento implícito de um método.

Depois, para chamar dentro do método o bloco que foi passado utilize a palavra **yield**

```
def foo
  # Call the block
  yield
  yield
end

foo { puts "Exec the block"}
```

Perceba que ao chamar o método, o bloco será executado duas vezes.

5- E se o bloco for opcional?

O ruby oferece um método chamado **block_given? **para verificar se o bloco foi passado como argumento

```
def foo
  if block_given?
    # Call the block
    yield
  else
    puts "Sem parâmetro do tipo bloco"
  end
end

foo
foo { puts "Com parâmetro do tipo bloco"}
```

Note que você criou um método que executa um trecho de código se o bloco for passado como argumento e outro trecho caso não seja.



6- Outra forma de receber blocos como parâmetro é utilizar o símbolo **&**

Ex:

```
def foo(name, &block)
  @name = name
  block.call
end

foo('Leonardo') { puts "Hellow #{@name}" }
```

Para executar um bloco recebido desta forma é necessário apenas utilizar o nome do bloco acompanhado pelo método **call.**

Outra dica importante é sempre deixar o **&nome_do_bloco** como último parâmetro a ser recebido pelo método



7- Você também pode passar um bloco que ocupa várias linhas como parâmetro

```
def foo(numbers, &block)
  if block_given?
    numbers.each do |key, value|
      block.call(key, value)
    end
  end
end

numbers = { 2 => 2, 3 => 3, 4 => 4 }


foo(numbers) do |key, value|
  puts "#{key} * #{value} = #{key * value}"
  puts "#{key} + #{value} = #{key + value}"
  puts "---"
end
```

Ao chamar o bloco  você passou os parâmetros que ele precisa para ser executado

#### **Lambda**

Bastante similar aos blocos com as seguintes diferenças:



**Sintaxe**

Uma lambda é iniciada com a palavra **lambda.**

1- Crie um arquivo chamado **lambda.rb **com o seguinte código

```
first_lambda = lambda { puts "my first lambda"}
first_lambda.call
```

Ela pode ser guardada em uma variável para ser chamada futuramente com o método **call**.

2- Você pode abreviar a declaração de uma lambda da seguinte forma

```
first_lambda = -> { puts "my first lambda"}
first_lambda.call
```

3- Uma lambda também pode receber parâmetros para sua execução

```
first_lambda = -> (names){ names.each { |name |puts name} }

names = ["joão", "maria", "pedro"]

first_lambda.call(names)
```

Perceba que você executou um block dentro de uma lambda



4- Em lambdas que ocupam várias linhas, não declare a lambda de forma abreviada e utilize o **do..end**

```
my_lambda = lambda do |numbers|
  index = 0
  puts 'Número atual + Próximo número'
  numbers.each do |number|
    return if numbers[index] == numbers.last
    puts "(#{numbers[index]}) + (#{numbers[index + 1]})"
    puts numbers[index] + numbers[index + 1]
    index += 1
  end
end

numbers = [1, 2, 3, 4]

my_lambda.call(numbers)
```

**Argumentos**

1- Diferente de blocks, você pode passar mais de uma lambda como argumentos de um método.

```
def foo(first_lambda, second_lambda)
  first_lambda.call
  second_lambda.call
end

first_lambda = lambda { puts "my first lambda"}
second_lambda = lambda { puts "my second lambda"}

foo(first_lambda, second_lambda)
```

## **Modules**

Um módulo é uma forma de agrupar classes, métodos e constantes. Ele é muito similar a classes, com a diferença de que você não consegue criar um objeto com ele pois ele não possui um construtor (new).

**Namespaces**

É uma forma de organizar o seu código e evitar colisões de recursos que possuem o mesmo nome.

1- Crie um programa chamado **namespace_reverse_word.rb** e coloque nele:

```
module ReverseWorld
    def self.puts(text)
      Kernel::puts text.reverse.to_s
    end
end

ReverseWorld::puts 'O resultado é'
```

2 – Execute o programa rodando:

```
ruby namespace_reverse_word.rb
```

3- Crie um arquivo chamado **namespaces_player.rb** com o seguinte código

```
module VideoGame
  class Player
    def info
      puts 'Precisa de um bom condicionamento físico'
    end
  end
end

module Football
  class Player
    def info
      puts 'Precisa de coordenação motora'
    end
  end
end

Football::Player.info
VideoGame::Player.info
