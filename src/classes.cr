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

  def change_height(value : Float64) # *Crystal combina todas as definições da classe em uma só
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

  def become_older(years : Int32) # ?overloading methods
    @age += years
  end

  def become_older(years : String)
    @age += years.to_i
  end

  # *Yields the current age of this person and increases
  # *its age by the value returned by the block
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

joao.become_older { |current_age| # ?become_older do |current_age| ... end
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

  def ==(other : self) # ?other for ComparePerson e o nome igual a outra retorna true
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

class PersonVisiblity
  private def say(message : String) # *only accessible from it self or (inside) of any subclass, nao é acessivel pela instancia
    puts message
  end

  def say_hello
    say "hello"
    self.say "hello self" # ?chamar o metodo de si mesmo tipo this.gameObject
    ohterPerson = PersonVisiblity.new
    # !ohterPerson.say "hello"# => Error: private method 'say' called for PersonVisiblity
  end
end

class Employee1 < Person
  def say_bye
    say "bye" # can access say method, is a subclass
  end
end

personVisiblity = PersonVisiblity.new
personVisiblity.say_hello

class Foo
  private class FooFoo
  end

  a = FooFoo.new
  # !Foo::FooFoo => Error: private constant Foo::FooFoo referenced, só passo acessar pela classe internamente

  private ONE = 1
  b = ONE # OK
end

# !Foo::ONE => Error: private constant Foo::ONE referenced
foo = Foo.new

# ?protected can be invoked on instances of the same type as the currrent type and instances in the same namespace
class ProtectedPerson
  protected def say(message : String)
    puts message
  end

  def say_hello
    say "hello p"
    self.say "hello p"

    other = ProtectedPerson.new
    other.say # same type and same namespace
  end
end

one_more_protected = ProtectedPerson.new

# !one_more_protected.say "hello" => Error: protected method 'say' called for ProtectedPerson

class Animal
  def make_a_person_talk
    person = Person.new
    # !person.say "hello" => Error: person is a Person but current type is an Animal
  end
end

module NamespaceTest
  class Foo
    protected def foo
      puts "Hello"
    end
  end

  class Bar
    def bar
      # Works, because Foo and Bar are under the same Namespace
      Foo.new.foo
    end
  end
end

class Parent
  protected def self.protected_method
    puts "protected_method"
  end

  def instance_method
    Parent.protected_method
  end

  def self.class_method
    Parent.protected_method
  end
end

class Child < Parent
  Parent.protected_method # can call

  def instance_method
    Parent.protected_method # OK
  end
end

class Parent::Sub
  Parent.protected_method
end

# !Parent.new.protected_method => Error: undefined method 'protected_method' for Parent
# !Parent.protected_method => Error: protected method 'protected_method' called for Parent.class
Parent.new.instance_method # Parent.instance_method

private def current_file_top_level # *only visible in current file, the same for self.methods inside private classes
  puts "Hello"
end

class Human
  def initialize(@name : String)
  end

  def greet
    puts "Hi, I'm #{@name}"
  end

  def say(msg : String)
    puts "Hi, #{msg}"
  end
end

class Children < Human
end

child = Children.new "Child"
child.greet
child.say "I'm just a kiiiiid And life is a nightmare"

class Employee < Human
  # *When defined a new or initialize, its superclass constructors are not inherited
  def initialize(@name : String, @company_name : String)
  end

  def greet
    super # *can call supermethods, it will call greet from superclass (Human)
    puts "Hi, I'm #{@name} and work at #{@company_name}"
  end

  def say(msg : Int32) # *override methods, can change the type of the message (specialized methods)
    puts "Good Night, I worked for #{msg} hours"
  end
end

# !Employee.new "Jorge" => Error: wrong number of arguments for 'Employee.new' (given 1, expected 2)
employee = Employee.new "Jorge", "Microsoft"
employee.greet
employee.say 9

class Bar
end

class BarBar < Bar
end

bar_bar_arr = [BarBar.new] of BarBar # default, current type
bar_bar_arr2 = [BarBar.new] of Bar   # *cast to be a Bar array, wich it's right bc BarBar is a Bar
# !bar_arr = [Bar.new] of BarBar => error, Bar cant be a BarBar but BarBar can be a Bar

abstract class Animal # ?cant instantiate
  def talk
  end
end

class Dog < Animal
  def talk
    puts "Au!"
  end
end

class Cat < Animal
  def talk
    puts "Miau!"
  end
end

class PetOwner
  getter pet : Animal

  def initialize(@name : String, @pet : Animal) # ?pet will be a virutal type, Animal+ (any animal sucblass)
  end
end

pai_de_pet = PetOwner.new "João", Cat.new
pai_de_pet.pet.talk

# *Class methods (or module)
class CaesarCipher # ?https://en.wikipedia.org/wiki/Caesar_cipher
  def self.encrypt(string : String)
    encrypted = string.chars.map { |char| ((char.upcase.ord - 52) % 26 + 65).chr }.join
    puts encrypted
  end

  def CaesarCipher.decrypt(string : String)
    decrypted = encrypt(string)
    puts decrypted
  end
end

CaesarCipher.encrypt("HELLO") # => "URYYB"
CaesarCipher.decrypt "URYYB"  # => HELLO

# *Class variables

class Counter
  @@instances = 0 # ?its related to the class with the @@, not the instance

  def initialize
    @@instances += 1 # modify the variable every time a new instance is created
  end

  def self.instances
    puts @@instances
  end
end

Counter.instances # => 0
Counter.new
Counter.new
Counter.new
Counter.instances # => 3
