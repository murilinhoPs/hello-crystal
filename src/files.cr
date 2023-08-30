def read_file_1
  if ARGV.size != 1
    puts "Passe o nome do arquivo como parâmetro"
    exit 1
  end

  file = ARGV[0]
  content = File.read(file)
  puts content
end

def write_file_1
  if ARGV.size != 2 # recebe 2 params, o nome do arquivo e o que vai escrever
    puts "É necessário informar o nome do arquivo e o conteúdo a ser escrito!"
    exit 1
  end

  file, content = ARGV

  # File.write(file, content) # sobrescreve o conteúdo
  File.write(file, content, mode: "a") # adiciona o conteudo no arquivo, mantendo oq já existia
  puts File.read(ARGV[0])
end

def read_existent_file
  if ARGV.size != 1
    puts "Passe o nome do arquivo como parâmetro"
    exit 1
  end

  file = ARGV[0]

  if File.exists?(file)
    puts "Arquivo existe!"
    puts File.read(file)
  else
    puts "Arquivo não existe!"
    exit 1
  end
end

def read_file_size_or_empty
  if ARGV.size != 1
    puts "É necessário informar um nome de arquivo!"
    exit 1
  end

  file = ARGV[0]
  if File.exists?(file)
    if File.empty?(file)
      puts "Arquivo está vazio"
      exit 1
    else
      puts "Arquivo tem conteúdo"
      size = File.size(file)
      puts "Seu tamanho de caracteres é #{size}"
    end
  else
    puts "Arquivo não existe!"
    exit 1
  end
end

def read_updated_at
  if ARGV.size != 1
    puts "É necessário informar um nome de arquivo!"
    exit 1
  end

  file = ARGV[0]

  puts File.info(file).modification_time
end
