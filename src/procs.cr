# https://crystal-lang.org/reference/1.9/syntax_and_semantics/literals/proc.html
# https://stackoverflow.com/questions/49292100/what-is-a-proc-in-crystal-lang

def with_proc(x : Proc(*T, Int32)) forall T
  T
end

with_proc(->(x : Bool) { x ? 1 : 0 })         # => Tuple(Bool)
with_proc(->(x : Int32, y : Int32) { x + y }) # => Tuple(Int32, Int32) e Proc(Int32, Int32, Int32), ultimo é o retorno (recebe duas int e retorna uma int)

def num_proc(x : Int32, y : Int32, proc : Proc(Int32, Int32, Number)) # um proc que recebe 2 int, e retorna um int
  # vou fazer alguma operação com números
  operation = proc.call(x, y)
  puts operation
  operation
end

num_proc(x: 1, y: 3, proc: ->(n1 : Int32, n2 : Int32) { n1 + n2 })
num_proc(x: 1, y: 4, proc: ->(n1 : Int32, n2 : Int32) { n2 - n1 })
num_proc(x: 2, y: 3, proc: ->(n1 : Int32, n2 : Int32) { n1 * n2 })
num_proc(x: 7, y: 3, proc: ->(n1 : Int32, n2 : Int32) { n1 // n2 }) # // arredonda pra baixo

puts "------------------"

# OU
sum_proc = ->(n1 : Int32, n2 : Int32) { n1 + n2 }
num_proc(x: 1, y: 3, proc: sum_proc)

minus_proc = ->(n1 : Int32, n2 : Int32) { n2 - n1 }
num_proc(x: 1, y: 4, proc: minus_proc)

mult_proc = ->(n1 : Int32, n2 : Int32) { n1 * n2 }
num_proc(x: 2, y: 3, proc: mult_proc)

int_divide_proc = ->(n1 : Int32, n2 : Int32) { n1 / n2 } # retorna Float
num_proc(x: 7, y: 3, proc: int_divide_proc)

num_proc(x: 7, y: 3, proc: ->(n1 : Int32, n2 : Int32) { n1 // n2 }) # // arredonda pra baixo


puts "-------------------"

# OU
def sum(x : Int32, y : Int32)
  x + y
end

def_sum_proc = ->sum(Int32, Int32)
num_proc(x: 2, y: 4, proc: def_sum_proc) # => 6

def minus(x : Int32, y : Int32)
  y - x
end

def_minus_proc = ->minus(Int32, Int32)
num_proc(x: 2, y: 4, proc: def_minus_proc) # => 2

def multiply(x : Int32, y : Int32)
  x * y
end

def_multi_proc = ->multiply(Int32, Int32)
num_proc(x: 2, y: 4, proc: def_multi_proc) # 8

def divide(x : Int32, y : Int32)
  y / x # retorna Float
end

def_divide_proc = ->divide(Int32, Int32)
num_proc(x: 3, y: 6, proc: def_divide_proc) # => 2

puts "---------String----------"
str = "hello"
str_proc = ->str.count(Char) # proc, posso especificar qual funcao chamar mesmo uma ja existente da string por exemplo
puts str_proc.call('e') # => 1 só tem um E
puts str_proc.call('l') # => 2, tem dois LL's

puts "------Block-Proc-------"

def num_proc_block(&block : Int32 -> Int32)
end
