#### **POO**

POO (Programação Orientada a Objetos) é um  Paradigma de programação criado para lidar com softwares grandes e complexos. É um conceito seguido não só pelo Ruby, mas também por várias outras linguagens de programação como Java, Python, C++, etc.

Sua estrutura é definida por 04 pilares: **Abstração**, **Encapsulamento**, **Herança** e **Poliformismo**.

 

#### **Pilares**

A seguir, veja o conceito de cada pilar da Programação Orientada a Objetos:

 

**Abstração**

Ação de abstrair uma entidade do mundo real e transformá-la em uma classe

 

**Encapsulamento**

Ato de dividir um programa em diversas partes tornando-o flexível, fácil de modificar e incluir novas funcionalidades.

 

**Herança**

Habilidade de criar uma Classe com características de outra existente. A herança prove o reuso e reaproveitamento de código.

 

**Poliformismo**

Capacidade de utilizar um método de diferentes formas para diferentes Objeto

#### **Objeto**

### **O que é?**

Por definição, objeto é toda coisa material que pode ser percebida pelos sentidos, como por exemplo um carro, livro, cachorro, caneta, avião e etc.

Na programação um objeto é a representação de um objeto do mundo real.

Todos estes objetos apresentam duas característica em comum: informações e comportamentos.

Ex:  Cachorro

**Informações**

- **Raça**: Pastor Alemão
- **Peso**: 35 Quilos
- **Idade: 3 Anos**

**Comportamento**

- **Late**
- **Come**
- **Corre** 

Em POO chamamos as informações de **attributes **e os comportamentos de **methods**.

 

#### **Classe**

### **O que é?**

Tendo como exemplo o objeto carro, pense em uma classe como a planta deste carro. Com ela é possível construir vários carros.

Uma classe é como a planta de um objeto.


### **Classes no Ruby**

Uma classe é definida pela palavra **class** seguida de seu **Nome,** e finalizada pela palavra **end.**

O nome de uma classe deve sempre começar com letra maiúscula. Para nomes compostos utilize o padrão **CamelCase**.

1- Crie um arquivo chamado **computer.rb **com o seguinte código

```
class Computer
 def turn_on
   'turn on the computer'
 end
 
 def shutdown
   'shutdown the computer'
 end
end
```

Você criou a classe do objeto **Computer** com os métodos **turn_on** e **shutdown**.

2- Inicialize um novo objeto **Computer** e depois execute seu comportamento shutdown adicionando o seguinte código ao final do arquivo **computer.rb**.

```
computer = Computer.new
computer.shutdown
```

Neste programa você utilizou dois pilares da programação orientada a objetos:

**Abstração** -> representando o objeto Computer em uma classe.

**Encapsulamento **-> dividindo o projeto em pequenas partes.

3- Execute o programa

```
ruby computer.rb
```

4- Faça o teste novamente trocando a instrução **computer.shutdown** por **computer.turn_on****.**


#### **Herança**

Para herdar características de outra classe, adicione na frente do nome de uma classe filha o símbolo de menor e  depois o nome da classe pai.

Ex:

```
class ClasseFilha < ClassePai
end
```



1- Crie um programa chamado animal.rb com o seguinte código

```
class Animal 
 def pular
   puts 'Toing! tóim! bóim! póim!'
 end

 def dormir
   puts 'ZzZzzz!'
 end
end

class Cachorro < Animal
 def latir
   puts 'Au Au'
 end
end

cachorro = Cachorro.new
cachorro.pular
cachorro.dormir
cachorro.latir
```

#### **Require**

Em uma das aulas deste curso, você aprendeu a utilizar require ‘gem_name’ para carregar arquivos de uma gem e assim poder escrever códigos com funcionalidades desta biblioteca.

Com ele também é possível carregar arquivos ruby que foram escritos por você. 

Para exemplificar como isso acontece você criará um projeto onde alguns arquivos conterão apenas uma classe.

 

**Projeto**

1- Crie a pasta do projeto **Animal** executando

```
mkdir animal
```

2- Dentro da pasta animal crie um arquivo chamado **animal.rb** com o código:

```
class Animal 
  def pular
   puts 'Toing! tóim! bóim! póim!'
  end

  def dormir
    puts 'ZzZzzz!'
  end
end
```

3- Agora crie um arquivo com o nome **app.rb **e adicione a ele o código:

```
require './animal.rb'

animal = Animal.new

animal.pular
```

Perceba que no **require**, você especificou o arquivo que será procurado partindo do caminho relativo a **app.rb**.

Quando você não está trabalhando com gems e quer carregar um arquivo a partir do caminho onde o código será executado, utilize o **require_relative**.

4- Substitua o código de **app.rb **por

```
require_relative 'animal'
 
animal = Animal.new
animal.pular
```

Se o arquivo **animal.rb **estivesse dentro de uma pasta chamada example, o caminho ficaria ‘example/animal’.Como só existe um arquivo chamado **animal **não é preciso especificar a sua extensão.

5- Agora, crie um arquivo chamado **cachorro.rb** com o código:

```
class Cachorro < Animal
  def latir
    puts 'Au Au'
  end
end
```

A classe **Cachorro** recebe como herança a classe **Animal**.

Porque o **require_relative** de **animal.rb **não está ai?

A resposta é simples:

Você irá inicializar a classe **Cachorro** dentro de **app.rb** e esse arquivo já faz um require_relative de **animal.rb**!

 

6- Para incluir a inicialização e execução dos métodos da classe **Cachorro **substitua o arquivo de **app.rb** por:

```
require_relative 'animal'
require_relative 'cachorro'

puts '--Animal--'
animal = Animal.new
animal.pular

puts '--Cachorro--'
cachorro = Cachorro.new
cachorro.pular
cachorro.latir
```

7- Execute o programa e veja o resultado

```
ruby app.rb
```

#### **Escopo das variáveis**

Agora que você sabe dividir um programa em vários arquivos é interessante aprender sobre os diferentes tipos de escopos de variáveis presentes no Ruby. Com este conhecimento você terá a capacidade de escolher qual utilizar dependendo da situação.

As variáveis se dividem em 04 tipos:

- **Variável Local**
- **Variável Global**
- **Variável de Classe**
- **Variável de Instância**

A seguir, veja características de cada uma:

 

### **Variável Local**

É declarada com a primeira letra de seu nome sendo uma letra minúscula ou sublinhado.

Pode ser **acessada apenas onde foi criada**. Por exemplo, se você definir uma variável local dentro de de uma classe ela estará disponível apenas dentro desta classe, se a definiu dentro de um método conseguirá acessá-la apenas dentro deste método e assim por diante.

Exemplo:

```
class Bar
  def foo
    # Pode ser definida como local ou _local
    local = 'local é acessada apenas dentro deste metodo'
    puts local
  end

  def example
    local
  end
end

bar = Bar.new
bar.foo
```



### Variável Global

Declarada com o prefixo $.

Pode ser **acessada em qualquer lugar do programa**.

Seu uso é **FORTEMENTE DESENCORAJADO** pois além de ser visível em qualquer lugar do código, também pode ser alterada em inúmeros locais ocasionando dificuldades no rastreamento de bugs.

Exemplo:

```
class Bar
  def foo
    $global = 0
    puts $global
  end
end
 
class Baz
  def qux
    $global += 1
    puts $global
  end
end
 
bar = Bar.new
baz = Baz.new
bar.foo
baz.qux
baz.qux
puts $global
```



### **Variável de Classe**

É declarada com o prefixo @@.

Pode ser acessada em qualquer lugar da classe onde foi declarada e seu valor é **compartilhado** entre todas as **instâncias de sua classe**.

Exemplo:

```
class User
  @@user_count = 0
  
  def add(name)
    puts "User #{name} adicionado"
    @@user_count += 1
    puts @@user_count
  end
end

first_user = User.new
first_user.add('João')

second_user = User.new
second_user.add('Mario')
```



### **Variável de Instância**

Seu nome começa com o símbolo @.

Semelhante a variável de classe, tendo como única diferença o valor que **não é compartilhado** entre todas as **instâncias de sua classe**.

Exemplo:

```
class User
  def add(name)
    @name = name
    puts "User adicionado"
    hello
  end

  def hello
    puts "Seja bem vindo, #{@name}!"
  end
end

user = User.new
user.add('João')
```


