# concepts review
texto = "crystal 4 noobs"

puts typeof(texto) # tipo da variavel
puts texto.size
puts texto.reverse

puts texto[0]    # retorna o char daquela posicao da string, "c"
puts texto[0, 4] # retorna os 4 primeios chars "crys"
puts texto[0..4] # retorna os 4 primeiros chars, "cryst"

puts texto.includes?("crystal") # true
puts texto.starts_with?("bla")  # false
puts texto.ends_with?("noobs")  # true

message = "Hello World!"
puts message == "Hello Crystal!",                          # false
  message.compare("hello world!", case_insensitive: true), # 0
  message.compare("hello world", case_insensitive: true),  # 1
  message.compare("hello world!", case_insensitive: false) # -1

text2 = "my cat is crazy"
puts text2
new_text = text2.sub("crazy", "cute")
puts "now %s" % new_text # concat string with % and one element

vazio = ""
puts vazio.size     # return 0
puts vazio.empty?   # true
puts vazio.blank?   # true
puts vazio.presence # nil

blank_space = "  \t\n\n\t"
puts blank_space.size     # returns 6
puts blank_space.empty?   # true, nada escrito nela
puts blank_space.blank?   # false, não tem nada escrito mas ela não está vazia tem espaçamentos
puts blank_space.presence # nil

numberS = "42.5"
numberIntS = "42"
puts numberS.to_f    # returns as a float
puts numberIntS.to_i # returns as a int, 42

text3 = "Outra string sla"
puts text3.split
puts text3.split(" ")
puts text3.split(/ +/)

text4 = "key:secret"
puts text4.split(":")
key, secret = text4.split(":")
puts key
puts secret

name = "Murilo"
age = 24

puts "O meu nome é %s" % name
puts "O meu nome é %s e minha idade é %s" % {name, age}                         # Tuple
puts "O meu nome é %s e minha idade é %s" % [name, age]                         # Array
puts "O meu nome é %{nome} e minha idade é %{idade}" % {nome: name, idade: age} # Named Tuple
sprintf "O meu nome é %s e minha idade é %s", name, age

text5 = "Hello World!"
puts text5[6, 5], # depois do index 6 (.....o ), retorna 5 chars da string => World
  text5.size,
  text5[6, text5.size - 6 - 1], # extrair apenas o que está entre Hello e !, subtrair o tamanho da string menos o tamanho do começo e do final de chars (6 no inicio e 1 no final)
  text5[6..-2],                 # -1 para o final do index (indicar que é o final), -1 excluindo o ultimo caractere
  text5.sub(6..-2, "Crystal"),  # replace the first index to -2 o mesmo de baixo
  text5.sub("World", "Crystal") # replace world for crystal

text6 = "Hello World! How are you, World?"
puts text6.sub("World", "Crystal"), # replace FIRST World occurences
  text6.gsub("World", "Crystal")# replace ALL World occurences
