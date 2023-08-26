module Conditions
  message = "Hello World!"
  if !message.starts_with? "Olá"
    puts "I didn't understand that." # print this
  end                                # if negativo é o mesmo que unless
  unless message.starts_with? "Olá"
    puts "I didn't understand that." # print this
  end

  a = 2
  b = 4
  if a > b # verifica se a condição é verdadeira
    puts a
  elsif a < b
    puts b
  else
    puts "igual!"
  end

  unless a >= b # a condição precisa ser falsa
    puts b      # print b
  else
    puts a
  end

  c = 6
  case c
  when 5
    puts 5
  when 6
    puts 6
  end

  puts "a é maior" if a > b
  puts "b é maior" if b > a

  str = "Crystal is awesome"
  index = str.index "aw"
  if !index.nil?
    puts str                # Crystal is awesome
    puts "#{" " * index}^^" #            ^^
  end
end
