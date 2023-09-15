# ?Cada yield chama o bloco de código, chama twice pq exeuta duas vezes não por causa de kpop
def twice(&) # *& define um bloco de codigo que vai receber
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

pairs do |_, second| # *Ommit the first parameter
  print second
end

# *Short syntax => block_method &.some_method, fazer algo direto com o primeiro argumento, ele é passado como argumento para o some_method

puts ["a", "b"].join(",") { |s| s.upcase }
puts ["a", "b"].join(",", &.upcase)
# method &.+(2), somar mais 2 no valor
# method(&.[index]), passar como index
