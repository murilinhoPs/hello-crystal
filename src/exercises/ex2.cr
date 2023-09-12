loop_size = 8
positive = 0
i = 0
a = 0
n = 1

while i < loop_size
  i += 1
  puts ":"
  a = read_line.not_nil!.to_i
  if a < 0
    n *= a
   puts "numero: #{n}"
  else
    positive += 1
  end
end

puts "positive #{positive}"
if positive >= 8
  puts "Não tiveram números negativos"
else
    puts "A multiplicação dos números negativos é: #{n}"
end
