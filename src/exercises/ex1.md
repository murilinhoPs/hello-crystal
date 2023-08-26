# Problema
o usuário precisa adivinhar um número aleatório de 1 a 20 digitando no console, o programa termina
quando o usuário acertar e deve informar ao usuário quando for menor ou maior que o número aleatório

## resumo
- Digitar um número
- Gerar um número random
- Terminar o programa quando o usuario acertar

## Variaveis
- random_number
- user input (gets)
- bool when user_input == random_number
- bool when user_input > or < random_number

## "Código"
```
    puts "Adivinhe um número de 1 a 20"

    // dados
    user_number = input.toInt()
    random_number = new Random.range(1, 20)

    // logica
    if user_number == random_number
      puts "Você acertou %s == %s!" % {user_number, random_number}
      break
    elsif user_number > random_number
      puts "O ${user_number} é MAIOR que o número gerado"
    else
      puts "O ${user_number} é MENOR que o número gerado"
    end
    puts "Você não acertou, tente novamente"
    user_number = input.toInt()

```