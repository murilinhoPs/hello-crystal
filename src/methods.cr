def some_method(x, y = 1, z = 3) # x is required, não tem default value, y e z sao nomeados
end

some_method 10, z: 4, y: 6
some_method 10, y: 2, z: 3
some_method y: 3, x: 8

# some_method 10, y: 3, x: 2 # Error: argument for parameter 'x' already specified
def sum(*numbers) # *... splat parameter
  total = 0
  numbers.each do |value|
    total += value
  end
  total
end

# numbers are treated as a Tuple(Int32, Int32, Int32)
puts sum(1, 2, 3) # => 6

# todo parametro dps do *splat é paremetro NOMEADO (nao precisa ter default value)

def sum(*numbers, initial = 0) # named argument (not required)
  total = initial
  numbers.each do |value|
    total += value
  end
  total
end

puts sum 1, 2, 3              # => 6
puts sum 1, 2, 3, initial: 10 # => 16

def sum(*numbers, initial) # required named argument, without default value
  total = initial
  numbers.each do |value|
    total += value
  end
  total
end

# puts sum 1, 2, 3  # Error, missing argument: initial
puts sum 1, 2, 5, initial: 10 # => 18

def foo(*, x)
  1
end

def foo(*, y) # overload com y ou x
  2
end

puts foo(y: "yyyy") # 2
puts foo x: "xxxx"  # 1

def after_param(x, y, *, nomeado)
end

# after_param 1, 2, 3 # Error,  wrong number of arguments (given 3, expected 2)
# after_param 1, 2, 3 # Error, missing argument: nomeado
after_param 1, 2, nomeado: 3 # nao preciso passar o splat, mas o nomeado é required

def splat_tuple(x, y)
  return x + y
end

tuple = {1, 2}
puts splat_tuple *tuple # => 3

def double_splats(x, **others) # pega qualquer outro argumento que passar pra essa função como named arguments
  puts others                  # return the named argument as a NamedTuple
end

double_splats 1, y: 3, z: 4    # {y: 3, z: 4}
double_splats y: 2, x: 1, z: 3 # {y: 2, z: 3}

def double_splat_tuple(x, y)
  puts x - y
end

tuple = {y: 3, x: 10}
double_splat_tuple **tuple # => 7, posso passar uma named tuple como argumento em splat com **

class Six
  def +(num)
    6 + num
  end
end

def add(x, y)
  x + y
end

def restrict_add(x : Number, y : Number) # Só vai aceitar number
  x + y
end

puts add Six.new, 10 # => 16
# restrict_add Six.new, 10 expected argument #1 to 'restrict_add' to be Number, not Six
# mesmo que a classe ou objeto tenha o método + nesse caso não pode passar como param
# pq não é um numero, melhor criar variacoes do método dependendo do que ele pode aceitar

def accept_type(x : Int32.class)
  puts "Got Int32"
end

def accept_type(x : String.class)
  puts "Got String"
end

accept_type 32.class # => "Got Int32"
accept_type String   # => Got String"

def restrict_tuples_splt(*args : Int32) # só vai aceitar tipo de int32 na tuple inteira
end

def any_tuples(*args : _) # pode aceitar multiplos tipos
end

# Free variables
def free_type(x : T) forall T # use a free Type = forall T, can use the T for validations
  puts T
end

free_type 1        # Int32
free_type("hello") # String

def free_array(x : Array(T)) forall T
  puts "Array: #{T}"
end

free_array [1, 2]   # => Array: Int32
free_array [3, "a"] # => Array: (Int32 | String)

def free_class_type(x : T.class) forall T
  p! Array(T)
end

free_class_type(Int32)  # => Array(Int32)
free_class_type(String) # => Array(String)

def multi_free(element : T, array : Array(T)) forall T
  array << element
end

puts multi_free(4, [1, 2, 3]) # => [1, 2, 3, 4] todos os argumentos precisam ser do mesmo Type

def foo(*x : *{Int32, String})
end

def foo(*x : *T) forall T
end

def foo(**x : **T) forall T
end

def with_proc(x : Proc(*T, Int32)) forall T # explicado em outra sessão
  T
end

def return_string : String
  "Hello!"
end

def return_nil : Nil # sempre vai retornar Nil independente do resultado da função, o retorno não interessa (o mesmo que Void)
  1 + 2
end

# def return_void : Void # mais usado com C bindings
#     1 + 2
# end
# https://crystal-lang.org/reference/1.9/syntax_and_semantics/return_types.html
puts typeof("hello")          # => String
puts typeof(raise "No Input") # => NoReturn

def names_example(external_name internal_name)
  puts internal_name # nome usado internamente pelo método
end

names_example external_name: 1

def plan(begin begin_time, end end_time) # usado nomes com keywords
  puts "Planning between #{begin_time} and #{end_time}"
end

plan begin: Time.local, end: 2.days.from_now

def increment(value, by amount) # um nome diferente internamente for better read
  value + amount
end
