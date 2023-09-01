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
pessoa.name = "Jorge II"
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
