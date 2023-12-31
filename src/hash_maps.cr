# hash = dart.maps
tools = {
  "Flutter" => "Dart",
  "React"   => "JavaScript",
  "Android" => "Kotlin/Java",
  "IOS"     => "Swift/Objective-C",
}

planets = {
  "Marte"   => 1,
  "Júpiter" => 2,
  "Saturno" => 3,
  "Terra"   => 4,
}

space = {
  "Marte"   => 1,
  "Júpiter" => 2,
  "Saturno" => 3,
  "Terra"   => 4,
  "Lua"     => 5,
}

puts tools.keys
puts tools.values

puts planets,
  planets.size, # a quantidade de itens, 4
  planets.keys  # chaves de cada item

planets["Plutão"] = 7 # adiciona a chave Plutão com valor 7
puts planets
puts planets.has_key? "Plutão" # true
puts planets.has_key?("Lua")   # false
puts planets.has_value? 3      # true
puts planets.has_value?(8)     # false

# Check values in a Hash, quantas vezes aparece aquela key no map (value = quantidade)
palavras = ["gato", "cachorro", "cobra", "gato", "joaninha", "formiga", "gato", "cachorro"] # 3 gatos, 2 dogs, 1 cobra, 1 joaninha, 1 formiga
count = {} of String => Int32                                                               # Hash vazio
def palavras_count_hash(arr : Array(String)) : Hash(String, Int32)
  hash = {} of String => Int32

  arr.each { |palavra|
    if !hash.has_key?(palavra) # o hash tem a palavra? se não tiver, adiciona o valor 0 nela
      hash[palavra] = 0
    end
    hash[palavra] += 1 # o hash já tem a key? Adiciona +1 no valor dela, quer dizer que ja passou por ela uma vez
  }
  return hash
end

count = palavras_count_hash(palavras)
puts count
count.each { |palavra, qnt|
  puts "#{palavra}: #{qnt}"
}

puts planets,
  space

# merge
more_planets = planets.merge({"Vênus" => 5, "Marte" => 10}) # returns a new hash with these two new values, planets stays the same
puts more_planets
puts planets # .merge não modifica o hash original

puts space.merge!({"Plutão" => 5, "Marte" => 20}) # metodo com ! modifica ele mesmo, side effect
puts space

# Manipulate Hash
puts planets.delete("Marte")
puts planets # {"Júpiter" => 2, "Saturno" => 3, "Terra" => 4, "Plutão" => 7}
planets["Marte"] = 1
puts " "

puts planets.reject("Marte")                                           # retorna todos do mapa que nãoo sejam Marte, tem sua versão com side effect !
puts planets.select { |name, value| value > 2 && name.includes?("r") } # {"Saturno" => 3, "Terra" => 4}, não moidifica o hash e tem sua versao com !

planets.clear # limpa o hash inteiro => {}
puts planets,
  ""

planetas = {
  "Marte" => {
    "cor"    => "Vermelho e marrom...",
    "number" => 1,
  },
  "Júpiter" => {
    "cor"    => "Marrom e laranja...",
    "number" => 2,
  },
  "Saturno" => {
    "cor"    => "Dourado, marrom e com tons de verde...",
    "number" => 3,
  },
  "Terra" => {
    "cor"    => "Azul, marrom, verde e com tons de branco...",
    "number" => 4,
  },
}
puts planetas.each { |key, value|
  color = value["cor"] # funciona como pegar o valor de um json
  puts "#{key}: sua cor é #{color}"
}
