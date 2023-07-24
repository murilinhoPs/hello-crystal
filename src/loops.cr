module Loops
  n = 0
  while n < 3 # executa enquanto essa condição é verdadeira
    puts "Crystal while: #{n}"
    n += 1
  end

  n2 = 0
  loop do # executa enquanto a condição for falsa, executa o loop até suprir aquela condição, do break if (vai parar o loop se a condição for verdadeira)
    puts "Crystal loop-do: #{n2}"
    n2 += 1
    break if n2 >= 3
  end

  n3 = 0
  until n3 >= 3 # executa enquanto essa condição for falsa, executa até o n ser igual ou maior que 3
    puts "Crystal until: #{n3}"
    n3 += 1
  end

  n4 = 0
  while n4 < 5 # executa enquanto essa condição é verdadeira
    # puts "Crystal while 5: #{n4}"
    n4 += 1
    if n4 == 3
      puts "Pula o while 3: #{n4}"
      next
    end
    puts "Final do while 5: #{n4}"
  end
end
