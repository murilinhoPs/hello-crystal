require "uuid"
require "json"

struct Person
  property name : String # property = getter and setter, get value and modify it
  getter email : String  # only get this value

  def initialize(@name, @email : String) # directly passing @email and @name, choose to pass or not the type
    @id = UUID.random
    @created_at = Time.utc
  end

  def initialize2(name : String, email : String) # passing the properties trough name and email
    @name = name
    @email = email
    @id = UUID.random
    @created_at = Time.utc
  end
end

person = Person.new("Murilo", "murilinhops@email.com")
p! person
# person.email = "error"
# person.name = "Novo nome" # OK
puts person.name,
  person.email

# record => simple struct with helpers
record Point, x : Int32, y : Int32
puts Point.new 1, 2 # <Point(@x=1, @y=2)>

struct PointStruct # record is the same as this struct with helpers
  getter x : Int32, y : Int32

  def initialize(@x : Int32, @y : Int32)
  end

  def copy_with(x _x = @x, y _y = @y) # copiar a classe com novos valores, mas não altera ela
    self.class.new(_x, _y)
  end

  def clone # clonar a mesma classe
    self.class.new(@x.clone, @y.clone)
  end
end

pointStr = PointStruct.new(1, 2)
puts pointStr                 # PointStruct(@x=1, @y=2)
puts pointStr.clone           # PointStruct(@x=1, @y=2)
puts pointStr.copy_with(3, 4) # PointStruct(@x=3, @y=4)
puts pointStr                 # PointStruct(@x=1, @y=2)

# https://crystal-lang.org/api/1.9.2/JSON/Serializable.html

struct JsonPerson
  include JSON::Serializable # includes the methods from_jton and to_json

  property name : String
  getter email : String

  @[JSON::Field(key: "id")] # pass another name field from json
  getter person_id : String
end

backend_id = UUID.random
json_person = %{{"name": "Murilo", "email": "murilinhops@email.com", "id": "#{backend_id}"}}
parsed_person = JsonPerson.from_json json_person

pp! parsed_person
puts parsed_person.person_id # not "id", parses id to person_id
puts parsed_person.email

struct Endereco
  getter rua : String, cidade : String, pais : String

  def initialize(@rua, @cidade, @pais)
  end
end

struct Pessoa
  getter nome : String, email : String, endereco : Endereco

  def initialize(@nome, @email, @endereco)
  end
end

endereco = Endereco.new("Rua 3", "São Paulo", "Brasil")
pessoa = Pessoa.new("Murilo", "murilinhops@email.com", endereco)
pp! pessoa # quebra de linha
