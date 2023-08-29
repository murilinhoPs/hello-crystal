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

# declaring arrays
vazio = [] of Int32 # não pode ser um array vazio: array = []
puts vazio.size,    # 0
  vazio.empty?      # true
vazio << 20
puts vazio.size, # 1
  vazio.empty?   # false

outro = Array(Int32).new
puts typeof(outro), # Array(Int32)
  outro.size        # 0

texto = "123456789112778" # quantas vezes um NUMERO aparece numa string
puts texto.size
count = [0] * 10 # array de tamanho 10, pq os numeros vao de 0 a 9. Nessa caso começa no 1 pq não tem 0, então 0 sempre vai ser 0

puts count
texto.each_char { |chr|
  puts "char: #{chr.to_i}"
  puts count[chr.to_i] += 1 # passa pelos indexes da string e adiciona +1 em cada index que passou mais de uma vez
}
puts count
count.each_with_index { |value, idx|
  puts "index: #{idx} #{value}" # printa os indexes de cada numero e quantas vezes ele apareceu
}
