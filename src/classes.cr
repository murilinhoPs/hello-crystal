require "json"

class PessoaExz
  def initialize(nome : String, altura : Float64)
    @nome = nome
    @altura = altura
  end

  # Getters
  def nome
    @nome
  end

  def altura
    @altura
  end

  # Setters
  def nome(value)
    @nome = value
  end

  def altura(value)
    @altura = value
  end
end

class Person
  # can init variables outside of initialize() => @age = 0
  property name : String
  getter age : Int32, height : Float64

  def name=(value); end # um tipo de setter simples pro name

  def initialize(@name, @height)
    @age = 14
  end

  def become_older
    @age += 1
  end

  def print_name
    puts @name
  end
end

class Person                         # definir os metodos na classe principal ou criar o def numa outra variação da classe
  def change_height(value : Float64) # Crystal combina todas as definições da classe em uma só
    @height = value
  end

  def become_older # posso re-definir o mesmo método, esse que vai ser prevalecer (o mais atual)
    previous_def   # chama esse mesmo método só que ants de ser re-definido
    @age += 2
  end
end

pessoa = Person.new(name: "Jorge", height: 1.65) # ==  Person.new "Jorge" 1.65
pessoa.print_name
pessoa.name=("Jorge II") #
pessoa.print_name

puts pessoa.height
pessoa.change_height(1.74)
puts pessoa.height

puts pessoa.age # 14
pessoa.become_older
puts pessoa.age # 17

class Lucky # passar oo default no construtor ou no geter, se for nil vai pegar o valor padrão
  DEFAULT_LUCKY_NUMBER = 42

  def initialize(@lucky_number : Int32 | Nil) # ou => (@lucky_number = DEFAULT_LUCKY_NUMBER)
  end

  def lucky_number
    @lucky_number ||= DEFAULT_LUCKY_NUMBER
  end
end

lucky = Lucky.new nil
puts lucky.lucky_number # 42
lucky = Lucky.new 44
puts lucky.lucky_number # 44

class JsonPerson
  include JSON::Serializable

  property height : Float64
  getter name : String

  def initialize(@name, @height)
  end

  def print_name
    puts @name
  end

  def change_height(value : Float64) # Crystal combina todas as definições da classe em uma só
    @height = value
  end
end

pessoa = JsonPerson.from_json(%{{"name": "Joao", "height": 1.74}})
puts pessoa.name,
  pessoa.height

pessoa.height = 1.78
puts pessoa.height

class AgePerson
  getter age : Int32

  def initialize(@name : String, @age : Int = 0)
  end

  def become_older
    @age += 1
  end

  def become_older(years : Int32) # overloading methods
    @age += years
  end

  def become_older(years : String)
    @age += years.to_i
  end

  # Yields the current age of this person and increases
  # its age by the value returned by the block
  def become_older(&)
    @age += yield @age
  end
end

joao = AgePerson.new "Joao"
puts joao.age

joao.become_older
puts joao.age # 1

joao.become_older(5)
puts joao.age # 6

joao.become_older("12")
puts joao.age # 18

joao.become_older { |current_age| # become_older do |current_age| ... end
 current_age < 20 ? 10 : 30       # se for menor que 20, adiciona 10 na idade se não adiciona 30
 }
puts joao.age # 28 (18 + 10)

class ComparePerson
  getter name : String

  def initialize(@name)
  end

  def self.compare(p1 : self, p2 : self)
    p1 == p2
  end

  def ==(other : self) # other for ComparePerson e o nome igual a outra retorna true
    other.name == name
  end

  def ==(other)
    false
  end
end

john = ComparePerson.new "John"
peter = ComparePerson.new "Peter"

puts ComparePerson.compare(john, peter) # false

class List
    def []=(index, value); end
end

list = List.new
list.[]=(2, 3)
