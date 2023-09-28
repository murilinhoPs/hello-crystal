# ?Cada yield chama o bloco de código, chama twice pq exeuta duas vezes não por causa de kpop
def twice(&) # *& define um bloco(block) de codigo que vai receber
  yield      # *executa o bloco de código
  yield      # *executa o bloco de código
end

def twiceBlock(&block) # ?pode dar um nome pro bloco, mas nesse caso é irrelevante
  yield
  yield
end

twice do
  puts "Hello!" # => Hello, Hello
end

twice() do
  puts "Hello2!" # => Hello, Hello
end

twice { puts "Hello3!" } # => Hello, Hello

def say_hello
  puts "Say Hello"
end

twice { say_hello }

def file(name)
end

def bar
end

# ?examples of reading
# foo(bar) do
#   something
# end

# # Same as:
# open(file("foo.cr")) do
#   something
# end

def twice(&)
  yield 1
  yield 2
end

twice do |yield_index| # ?with arguments, pode resgatar esse valor na função
  puts "Got #{yield_index}"
end
twice { |yield_index| puts "Got #{yield_index}" }

def many_yields(&)
  yield 1, 2, 3
end

many_yields { |x, y, z| puts x + y + z } # => 6
many_yields { |x, y| puts x + y }        # ?=> 3 posso especificar com menos valores do yield

# *Multiple values on yield
def something(&)
  yield 1, 'a'
  yield true, "hello"
  yield 2, nil
end

something do |first, second|
  p! typeof(first), typeof(second)
end

def pairs(&)
  yield 1, 2
  yield 2, 4
  yield 3, 6
end

pairs do |_, second| # *Ommit the first parameter or can ommit second parameter
  print second
end

# *Short syntax => block_method &.some_method, fazer algo direto com o primeiro argumento, ele é passado como argumento para o some_method
# method do |param|
#    something
# end
# method &.something (& is the block parameter)
# methos(&.something)

puts ["a", "b"].join(",") { |s| s.upcase }
puts ["a", "b"].join(",", &.upcase)
# method &.+(2), somar mais 2 no valor

# ? usually blocks methods are used to transform values, like below
# ? enumerableMap e enumerableSelect são exemplos de blocks
arry = [1, 2, 3]
puts arry.map { |x| x + 1 }         # => [2, 3, 4]
puts arry.select { |x| x % 2 == 1 } # => [1, 3]

# Returns o value para poder modificá-lo

def transform(value, &)
  yield value # value is the argumento
end

puts transform(1) { |x| x + 1 } # => 2

# *Accepts only ints, and expects bloc receive int as parameter and return an int too
def transform_ints(start : Int32, &block : Int32 -> Int32)
  result = yield start # the argument
  result * 2
end

puts transform_ints(2) { |x| x + 1 } # => 6 => (2 +1) = 3 => 3 *2 => 6

# *break and next

def thrice(&)
  puts "Before 1"
  yield 1
  puts "Before 2"
  yield 2
  puts "Before 3"
  yield 3
end

thrice do |i| # will only puts Before 1 and Before 2 bc of break == 2
  if i == 2
    break
  end
end

def twice(&)
  yield 1
  yield 2
end

puts twice { |i| i + 1 }         # => 3
puts twice { |i| break "hello" } # => will stops/breaks the method and return "hello"
puts twice { break 3, 4 }        # => {3, 4} : Tuple
p! twice { break }               # => nil

# ? will not return Got 1, bc when == 1 we're skpping that with next and do another thing
# ? continue the method and exit from that block
puts twice { |i|
  if i == 1
    puts "Skipping 1"
    next
  end
  puts "Got #{i}"
} # => Skipping 1 Got 2
# Wonderland (rua)

# *with ... yield

class WithYield
  def one
    1
  end

  # *returns the method inside it, modify what to yields
  def yield_with_self(&)
    with self yield
  end

  # *returns normally the method passed to the block
  def yield_normally(&)
    yield
  end
end

def one
  "one"
end

puts WithYield.new.yield_with_self { one } # => 1, the method inside the block
puts WithYield.new.yield_normally { one }  # => "one"

new_array = [{1, "one"}, {2, "two"}]
new_array.each do |(number, word)| # * sub-parameters of the array. |number, word|, se for tuple pode fazer assim
  puts "#{number}: #{word}"
end
# * não preciso usar sub-paramters, pode ser arg e extrair pelo index dele
new_array.each do |args|
  number = args[0]
  word = args[1]
  puts "#{number}: #{word}"
end

other_arr = [[1, "one"], [2, "two"]]
other_arr.each do |(number, word)|
  puts "#{number}: #{word}"
end

def int_to_int(&block : Int32 -> Int32)
  block
end

# * Captured the block as a proc and called it, only works with a type on the &block
proc = int_to_int { |x| x + 1 } # ? type = Proc(Int32, Int32), recebe um int e retorna outro int
puts proc.class
p! proc.call 1 # => 2

class Model
  def on_save(&block : -> String) # ? returns only a string
    @on_save_callback = block
  end

  def save
    # * se o callback não existir, o on_save_callback is nil
    if callback = @on_save_callback
      callback.call
    end
  end
end

model = Model.new
model.on_save do
  saved = "Saved"
  puts saved
  saved
end
p! model.save.class
model.save

def wrong_proc(&block : Int32 ->) #! não tem retorno, se quiser um retorno precisa especificar um tipo ou _ (qualquer retorno)
  block
end

proc = wrong_proc { |x| x + 1 }
p! proc.call 1 # => returns nil, pq o block não tem retorno (nil) só tem argumento

def correct_proc(&block : Int32 -> _) # ! tem um retorno de qualquer tipo
  block
end

proc = correct_proc { |x| x + 1 } # => Proc(Int32, Int32)
p! proc.call(1)                   # 2

proc = correct_proc { |x| x.to_s } # => Proc(Int32, String)
p! proc.call(1)                    # "1"
