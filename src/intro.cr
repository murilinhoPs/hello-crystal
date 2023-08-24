module Intro
    numero = 10
    numeroFloat = 5.2
    boolean = true
  
    # TODO: Strings
    texto = "daa"
    puts texto.reverse
    puts typeof(boolean)
  
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

