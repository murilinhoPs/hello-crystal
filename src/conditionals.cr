# revisao de condicionais e loops
# chomp -> Returns a new String with the last carriage return removed (that is, it will remove \n, \r, and \r\n).
puts "Digite sua idade"
idade = gets.not_nil!.chomp.to_i

if idade >= 18
  puts "Maior de idade"
else
  puts "Menor de idade"
end

if idade > 18
  puts "Maior de idade"
elsif idade < 18
  puts "Menor de idade"
else
  puts "Tem 18 anos"
end

# unless -> Ao contrário do if, só vai entrar no bloco se a condição for FALSA
unless idade >= 18
  puts "Você é menor de 18 anos" # só vai cair aqui se idade >=18 for falsa
else
  puts "Você é maior de 18!"
end

puts "Digite um número entre 20 e 30"
x = gets.not_nil!.chomp.to_i
puts "SIM" if x >= 20
puts "NÃO" if x != 20
begin
  # inicia um bloco de código
  x = x + 1; puts x
end if x < 30
puts "Não é 12..." unless x == 12
puts "Não é 12..." if x != 12

numero = 10
case numero
when 5
  puts "O número é 5"
when 10
  puts "O número é 10"
else
  puts "Eu não sei qual é o número..."
  exit 0 # força a sair do case
end

case numero # case pode verificar a tipagem também
when String
    puts "é uma string"
    puts numero.size
when Int32
    puts "é um int32"
    puts numero.abs
end

name = nil
ternary_name = name ? name : "default"
puts ternary_name
or_name = name || "default"
puts or_name
