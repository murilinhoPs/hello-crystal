require "file_utils"

puts Dir.current # pwd, mostrar o diretorio atual

if ARGV.size != 1
  puts "Você precisa informar o caminho do diretório"
  exit 1
end

path = ARGV[0]

dir = Dir.new(path)
dir.children.each { |ls|
  puts ls
}

tempdir = File.tempname  # cria o diretorio temporario, pode ter um suffix ou prefix
puts tempdir
FileUtils.mkdir(tempdir) # cria um diretorio, mkdir = make directory
FileUtils.cd(tempdir)    # entra em um diretorio/pasta especifico, cd dev/projetos-crystal
FileUtils.rm_rf(tempdir) # remove um arquivo ou diretorio de uma forma forçada, tipo o rm Dir/ ou rm -rf file_name
