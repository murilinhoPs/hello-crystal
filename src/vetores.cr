planetas = ["Marte", "Jupiter", "Saturno", "Terra"]
puts planetas[0],
  typeof(planetas) # Array(String)

inteiros = [3, 2, 1]
puts typeof(inteiros) # Array(Int32)

varios = [1, 3.14, "PI"]
puts typeof(varios) # Array(Float64 | Int32 | String)
# Em crystal o array pode ter uma variavel de um tipo diferente, cada posicao pode ter uma tipagem independente

planets = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
puts planets[0], # Mercúrio
  planets[2],    # Terra
  planets[-1]    # Jupter, ultimo index. se fosse -2 iria retornar o penultimo index

puts planets[0, 3], # ["Mercúrio", "Vênus", "Terra"], mostrar os 3 primeiros planetas a partir do index 0
  planets[0..3],    # ["Mercúrio", "Vênus", "Terra", "Marte"]. os ".." determina qual o primeiro e o ultimo index que deve ser mostrado, ele vai mostrar do index 0 até o index 3
  planets[0...3]    # ["Mercúrio", "Vênus", "Terra"]. mostra do index 0 até o 3, mas excluindo o 3 index, então mostra os index 0,1 e 2

planets.each_with_index { |planeta, index| # iterate over the array. Posso adicionar um offset pra começar o loop a partir de um index especifico
 puts "#{index}: #{planeta}" }

planets2 = ["Marte", "Júpiter", "Saturno"]

planets2 << "Plutão" # append / push
puts planets2        # ["Marte", "Júpiter", "Saturno", "Plutão"]

planets2.push("Vênus")
puts planets2 # ["Marte", "Júpiter", "Saturno", "Plutão", "Vênus"]

# declaring empty arrays
vazio = [] of Int32 # não pode ser um array vazio: array = []
puts vazio.size,    # 0
  vazio.empty?      # true
vazio << 20
puts vazio.size, # 1
  vazio.empty?   # false

outro = Array(Int32).new
puts typeof(outro), # Array(Int32)
  outro.size        # 0

# quantas vezes um NUMERO aparece na string
texto = "123456789112778"
puts texto.size
count = [0] * 10 # array de tamanho 10 com cada index de valor 0 (os numeros vao de 0 a 9). Nessa caso começa no 1 pq não tem 0, então 0 sempre vai ser 0

texto.each_char { |chr|
  puts count[chr.to_i] += 1 # passa pelos indexes da string e adiciona +1 em cada index que passou mais de uma vez. O index é igual o numero na string, index 0 = numero 0; index 1 = numero 1; index 9 = numero 9....
}

puts count
count.each_with_index { |value, idx|
  puts "index: #{idx} #{value}" # printa os indexes de cada numero e quantas vezes ele apareceu
}

# sum the arrays, add one array into the other in the order the sum occured
a = [2, 3, 4]
b = [5, 7, 9]
p! b + a # 5, 7, 9, 2, 3, 4]

# print the array multiple times
x = [1, 2] * 3 # [1, 2, 1, 2, 1, 2], mostra o vetor 3 vezes
y = [0] * 10   # array de 10 posicoes com valor 0
p! x
p! y

numeros = [10, 20, 21, 7, 5]
# arr.select! => modifies current array, side effect
bigger_than_ten = numeros.select do |num|
  num > 10
end
puts numeros.select { |num| num > 10 } # [20, 21]
puts bigger_than_ten                   # [20, 21]

smaller_than_ten = numeros.select { |num| num < 10 }
puts smaller_than_ten # [7, 5]

planets = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
puts planets.sample   # returns a random value from array
puts planets.sample 2 # returns TWO random values from array ou planets.sample(2)
puts planets.shuffle  # returns the array in a random way

nomes = ["Crystal", "4", "Noobs"]
puts nomes.join "-" # join the values from array using a "-" as separator

# Manipulate arrays
planets = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
planets.delete "Terra" # delete a value from the current/self array, doenst return a new array
puts planets # ["Mercúrio", "Vênus", "Marte", "Júpiter"]

planets = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
planets.delete_at(2) # delete at index 2, "Terra"
puts planets # ["Mercúrio", "Vênus", "Marte", "Júpiter"]

planets = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
puts planets.includes?("Mercúrio"), # true
  planets.first,
  planets[0]

planets = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
planets.insert 1, "Plutão" # planets.insert(1, "Plutao") => adds the value at the given indes
puts planets # ["Mercúrio", "Plutão", "Vênus", "Terra", "Marte", "Júpiter"]

planets = ["Mercúrio", "Vênus", "Mercúrio", "Terra", "Marte", "Júpiter", "Mercúrio"]
puts planets.uniq # ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
planets.uniq! # returns the current/self array without duplicates => ! is a side effec on self
puts planets # ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter"]
