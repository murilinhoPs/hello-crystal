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

def_sum_proc = ->sum(Int32, Int32)       # reference the function sum
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
puts str_proc.call('e')      # => 1 só tem um E
puts str_proc.call('l')      # => 2, tem dois LL's

puts "------Block-Proc-------"

# ! is the same as declaring a proc and passing as a block parameter

def num_proc_block(&block : Int32 -> Int32)
  block
end

captured_block = num_proc_block { |x| x += 1 }
p! captured_block.call 2

# https://crystal-lang.org/reference/1.9/syntax_and_semantics/closures.html
x = 0                                   # ! closure the X, o valor do X continua existindo e mudando dentro da proc enquanto a proc existir
num_proc = ->(int : Int32) { x += int } # *passo o int como param e somo ao X
block_proc = num_proc_block(&num_proc)

p! num_proc.call 2    # => 2
p! block_proc.call 10 # => 12
puts x                # => 12

# ? Is the same as above, just extracting the method

def add(x, y)
  x + y
end

adder = ->add(Int32, Int32)
p! adder.call(1, 2) # => 3

puts "------Forwarding Captured Blocks-------"

def capture(&block)
  block
end

def invoke(&block)
  block.call
end

captured = capture { puts "Captured" }
invoke(&captured)

def twice(&)
  yield
  puts "or"
  yield
end

twice_proc = capture { puts "Yes!" }
twice &twice_proc
# or
twice do
  twice_proc.call
end
# or
twice &->{ puts "Twice!" }

# or
def puts_twice
  puts "Puts Twice!"
end

twice &->puts_twice

puts "------Forwarding NON-Captured Blocks-------"

def only_twice(&)
  yield "Twice! 🎵"
end

def wrap_only_twice(&)
  puts "Before twice"
  only_twice do |param| # ? proprio parameter dele
    yield param
  end
  puts "After twice"
end

wrap_only_twice do |i|
  puts i # *vai printar o retorno do método only_twice, que é o yield "Twice"
end

puts "------With alias-------"
just_proc = Proc(Int32, String).new { |value| value.to_s }
just_proc.call 3

alias ProcAlias = Int32 -> String
proc_alias = ProcAlias.new { |value| value.to_s }
puts proc_alias.call 2
