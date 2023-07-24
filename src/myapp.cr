module Myapp
  VERSION = "0.1.0"

  puts "Digite Seu nome"
  nome = gets
  puts "Olá #{nome}"

  # TODO: Put your code here
  texto = "daa"
  numero = 10
  boolean = true
  puts texto.reverse

  texto1 = "teste 1"
  texto2 = "teste 2"
  puts "O número é: #{numero}"
  puts "Olha, %s e %s" % {texto1, numero} # ou
  puts sprintf "Olha com sprintf, %s e %s", texto1, texto2

  # Spaceship
  puts 3 <=> 3 # return 0 se os valores são iguais
  puts 3 <=> 4 # return -1 se o primeiro é menor que o segundo
  puts 4 <=> 3 # return 1 se o primeiro é maior que o segundo
end
