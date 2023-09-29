# https://crystal-lang.org/reference/1.9/syntax_and_semantics/generics.html

class MyBox(T) # ? type inference
  def initialize(@value : T)
  end

  def self.nilable(x : T)
    MyBox(T?).new x
  end

  def value
    @value
  end
end

int_box = MyBox(Int32).new(2)
puts int_box.value # => 2

# ? is the same as above, the compiler inferred the type T is a int32 bc of new(1) with an int
new_int_box = MyBox.new 1
puts new_int_box.value # => 1

string_box = MyBox.new "my box"
puts string_box.value # => "my box"

puts MyBox.nilable(1).class # => MyBox(Int32 | Nil), pq pode ser Nil ou Int32

module Foo(T)
  def self.foo
    T
  end

  def self.foo(x : T)
    "foo"
  end
end

puts Foo.foo "free foo 1"
puts Foo(Int32).foo(1)

module GenericModule(T)
  def t
    T
  end
end

class ImportGenericModule(U)
  include GenericModule(U)

  def initialize(@value : U)
  end
end

moo = ImportGenericModule.new 2
puts moo.t # => Int32

# ? "--------inheritance--------"

class Parent(T)
end

class Int32Child < Parent(Int32)
end

class GenericChild(K) < Parent(K)
end

# ? "--------various arguments--------"

class MArguments(*T)
  getter content

  def initialize(*@content : *T)
  end
end

m_arguments_1 = MArguments(Int32, String).new(9, "Ronaldo!")
p typeof(m_arguments_1)    # => MArguments(Int32, String
puts m_arguments_1.content # => {9, "Ronaldo!"}

m_arguments_2 = MArguments.new("Hello", ["World", "!"], 28)
p typeof(m_arguments_2)    # => MArguments(String, Array(String), Int32)
puts m_arguments_2.content # => {"Hello", ["World", "!"], 28}

class MParent(*T)
end

class Int32StringChild < MParent(Int32, String)
end

class MChild(*T) < MParent(*T)
end

parent_empty = MParent().new
p typeof(parent_empty) # * => MParent, não tem nenhum tipo a mais e precisa ser declarado como empty ()

# ! Error: can't infer the type parameter T for the generic class MParent(*T). Please provide it explicitly
# foo = MParent.new
