# hash = dart.maps
tools = {
  "Flutter" => "Dart",
  "React"   => "JavaScript",
  "Android" => "Kotlin/Java",
  "IOS"     => "Swift/Objective-C",
}
puts tools.keys
puts tools.values

planets = {
  "Marte"   => 1,
  "Júpiter" => 2,
  "Saturno" => 3,
  "Terra"   => 4,
}
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


