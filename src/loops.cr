puts "loop do"
i = 5
loop do # => for(i=0; i >= 10; i++), fazer o loop até que i >= 10
  i += 1
  puts i
  break if i >= 10
end

puts "while"
w = 6
while w < 10 # executar o loop enquanto w for < 0
  w += 1
  puts w
end

puts "until"
u = 4
until u >= 10
  u += 1
  puts u
end

puts "loop control"
n = 0
while n < 5
    n += 1
    if n == 3 # se for == 3, pula/cancela esse passo com o next e possa pro próximo número que é 4
        puts "n = 3"
        next
    end
    puts n
end

counter = 0
while true
  counter += 1
  puts "Counter: #{counter}"

  if counter >= 10
    break
  end
end
