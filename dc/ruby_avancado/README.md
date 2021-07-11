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

```

#### **Modules – Mixins**

Em uma aula passada você viu o uso de herança para que uma classe herde características de outra, porém, de uma forma onde a herança sempre era única.

Nessa aula você verá que é possível incluir o código de um módulo em outros locais e além disso, essa forma de compartilhamento te permitirá definir heranças multiplas para uma classe. Para melhor entendimento, veja isso na prática a seguir.

1- Crie um programa chamado mixins.rb e coloque nele:

```
module ImpressaoDecorada
    def imprimir text
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
    
    def gancho
      imprimir 'Gancho'
    end
end

class LutadorMuayThai
    include Pernas
    include Bracos
end

class LutadorBoxe
    include Bracos
end

lutadorx = LutadorMuayThai.new
lutadorx.chute_frontal
lutadorx.jab_de_direita

lutadory = LutadorBoxe.new
lutadory.jab_de_esquerda
```

2 – Execute o programa rodando:

```
ruby mixins.rb
```

Nós criamos um module ImpressaoDecorada e incluimos ele nos outros dois modules (pernas e braços), depois incluimos estes últimos dois modules nas classes LutadorX e LutadorY.



#### **Regex**

Abreviatura de **Regular Expressions **(Expressões Regulares), regex é uma sequência de caracteres especiais que nos ajudam a identificar (e selecionar) padrões de caracteres em strings.

#### **3 Maneiras de criar um Regex**

1 – Utilizando o formato **/…/**

**ex:**

```
/expressao/
```

Geralmente a mais utilizada.

**2 – **Através do formato **%r{…}**

**Ex:**

```
%r{expressao}
```

3 – Utilizando um Construtor através do Regexp.new(‘…’)

**Ex:**

```
Regexp.new('expressao')
```



#### Casamento de Padrões

É um ato que verifica a presença de padrões em uma cadeia de caracteres.

Pode ser realizado através do operador **=~** ou do método **match**

### 

### **Operador =~**

1- O operador **=~** retorna o offset, ou seja, a distância entre o começo da string até o local onde ocorre o casamento de padrão especificado na expressão.

```
/by/ =~ 'ruby'
```

2- A mesma comparação também pode ser realizada iniciando pela string.

```
'ruby' =~ /by/
```

3- Quando não ocorre o casamento de padrão, o resultado é **nulo**

```
'ruby' =~ /rails/
```



### Método match

1- Retorna um objeto do tipo **MatchData, **contendo todos os resultados do casamento de padrão.

```
phrase = "Hellow, how are you?"

match_data = /how/.match(phrase)
```

2- Em um objeto do tipo MatchData você pode, por exemplo, acessar o que vem antes do casamento através do método **pre_match**

```
match_data.pre_match
```

3- Ou acessar o que vem depois do casamento com **post_match**

```
match_data.post_match
```



### Metacharacters and Escapes

Os símbolos **(, ), [, ], {, }, ., ?, +, \*,****  **são **metacharacters. **Eles possuem um significado quando utilizados em expressões regulares.

1- Caso o padrão que você procura seja um **metacharacter**, utilize o símbolo de **escap**e **\ **para realizar a busca

```
/\?/.match('Tudo bem?')

/bem\!\!\!/.match('Muito bem!!!')
```



### **Character Classes**

É uma lista que informa quais caracteres devem aparecer em um ponto do casamento.

1- Uma **character class** é delimitada por colchetes [, ]

```
/[t]exto/.match('texto começando com t')
```

2- Você pode especificar um **range** com o símbolo **–**

```
/[1-5]/.match('123')
```

Assim, é procurado um padrão onde o primeiro número pode ser 1, 2, 3, 4 ou 5

3- Note que o casamento também ocorre em uma string que começa com o número 2

```
/[1-5]/.match('223')
```

4- O range pode ser utilizado para letras

```
/[a-z]/.match('Oi')
```

Existem alguns **metacharacters** que se comportam como **character classes**

5- Por exemplo, o **metacharacter** **\d** verifica o padrão [0-9]

```
/A\d/.match('A4')
```



### **Repetition**

É possível definir a repetição de um mesmo padrão, evitando escrever a mesma coisa diversas vezes.

1- Por exemplo, verifique o casamento de padrão em uma etiqueta que começa com uma letra e 3 números.

```
"A343".match(/[A-Z]\d{3}/)
```

Ao em vez de digitar \d\d\d você pode escrever **\d{3}**

2- Verifique se uma letra foi escrita mantendo o padrão de repetição entre três ou mais vezes

```
"BBB AAAA".match(/A{3,}/)
```

A vírgula em **{3, }** informa que a repetição pode ocorrer 3 ou mais vezes

Conclui-se que a Expressão Regular é uma ferramenta muito poderosa, capaz de identificar qualquer padrão em uma string. Caso se interesse pelo tema, recomendo fortemente que leia esta [documentação](https://ruby-doc.org/core-2.5.1/doc/regexp_rdoc.html).



#### **Math**

Math é um módulo nativo para funções matemáticas.

1- Sabendo a raiz quadrada de 64

```
Math.sqrt(64)
```

2- Verificando o logaritmo de 10000 na base 10

```
Math.log10(10000)
```

3- O logaritmo de 16 na base 2

```
Math.log2(16)
```

4- Calculando o cosseno para o ângulo de 30º Primeiro transforme o ângulo em um valor radiano

```
radian = 30 * (Math::PI / 180)
```

Depois utilize o método **cos**

```
Math.cos(radian)
```

O módulo Math também fornece o valor de duas constantes bastante utilizadas:

**E** e **PI**

5- Para consultar o valor da constante E execute

```
Math::E
```

6- Consulte o valor da constante **PI** com a instrução

```
Math::PI
```

Tenha acesso a mais métodos matemáticos do módulo Math através da [documentação](https://ruby-doc.org/core-2.2.0/Math.html).



**Time**

O Ruby conta com uma classe chamada Time para representar datas e horas.A seguir você verá como é natural utilizar alguns métodos dessa classe para obter informações do tempo.

**Trabalhando com times**

1- Para imprimir o horário atual execute

```
time = Time.now
puts time
```

2- Para o ano use o método **year**

```
puts time.year
```

3- Imprimindo o mês do ano com o método **month**

```
puts time.month
```

4- Para saber o dia do mês utilize o método **day**

```
puts time.day
```

5- O método **strftime** permite a formatação de uma data em uma forma específica. Essa formatação é feita por diretivas que começam com o símbolo de %.

```
time.strftime('%d/%m/%y')
```

Significado das diretivas

%d -> Dia do mês

%m -> Mês do ano

%y -> Ano

6- Verificando se o dia da semana é sábado

```
puts time.saturday?
```

Você também pode comparar duas datas.

7- Crie um novo objeto com o horário atual

```
time2 = Time.now
```

8- Ao comparar as datas de forma completa o resultado será **false**

```
time == time2 # => false
```

9- Comparando o ano das duas datas, o resultado será **true**

```
time.year == time2.year # => true
```


**Missing Methods**

Voltando para o conteúdo envolvendo classes e métodos, conheça agora o método **method_missing. **Ele é utilizado para interceptar chamadas a métodos que não existem.

Para saber **como implementar este método:**

1- Crie um arquivo chamado **method_missing.rb** com o seguinte código

```
class Fish
 def method_missing(method_name)
   puts "Fish don't have #{method_name} behavior"
 end
 
 def swim
   puts 'Fish is swimming'
 end
end
 
fish = Fish.new
fish.swim
fish.walk
```

A partir daí você pode controlar como responder este tipo de situação.Quando o método **walk** que não existe é chamado, o método **method_missing **faz uma interceptação. Nele é recebido como parâmetro o nome do método que não existe.






**Self**

No ruby, self é uma **variável especial** que **aponta** para o **objeto atual**.

1- Crie o arquivo **self.rb** com o seguinte código

```
class Foo
  attr_accessor :teste
  def bar
    puts self
  end
end

foo = Foo.new
puts foo
foo.bar
```

A variável **self** aponta para o **Objeto** onde ela se encontra.  No caso está apontando para uma instância da classe Foo e, por isso, as instruções **puts** **foo** e **puts** **self** retornam o mesmo resultado.

Perceba que a variável self **não precisa** ser declarada. Ela é disponível em qualquer lugar, mas não esqueça que seu valor é referente ao objeto que pertence.

**Variáveis self em objetos diferentes possuem valores diferentes.**

2- Com o **self** é possível criar **métodos de classe**,  que não precisam de uma instância para serem chamados.

```
class Foo
  def self.bar
    puts self
  end
end

Foo.bar
```

3- Você também pode utilizá-lo para se referir a atributos do objeto atual.

```
class Pen
  attr_accessor :color
  def pen_color
    puts "The color is " + self.color
  end
end

pen = Pen.new
pen.color = "blue"
pen.pen_color
```

O **self.color** retorna a cor do objeto **pen**.



