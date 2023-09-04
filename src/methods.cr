def some_method(x, y = 1, z = 3) # x is required, não tem default value
end

some_method 10, z: 4, y: 6
some_method 10, y: 2, z: 3
some_method y: 3, x: 8

def sum(*numbers) # *... splat parameter
  total = 0
  numbers.each do |value|
    total += value
  end
  total
end

# numbers are treated as a Tuple(Int32, Int32, Int32)
puts sum(1, 2, 3) # => 6

# todo parametro dps do *splat é paremetro NOMEADO

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

def foo(*elements, x)
  1
end

def foo(*elements, y) # overload com y ou x
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
