LIMIT = 5

puts "Adivinhe um número de 1 a #{LIMIT}"
user_number = read_line.not_nil!.to_i
random_number = Random.rand(LIMIT) + 1

loop do
  if user_number == random_number
    puts "Você acertou %s == %s!" % {user_number, random_number}
    break
  elsif user_number > random_number
    puts "O #{user_number} é MAIOR que o número gerado"
  else
    puts "O #{user_number} é MENOR que o número gerado"
  end
  puts "Você não acertou, tente novamente"
  user_number = read_line.not_nil!.to_i
end
