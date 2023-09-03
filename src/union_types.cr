# https://crystal-lang.org/reference/1.9/syntax_and_semantics/union_types.html

class A
  property a

  def initialize(value : Int32)
    @a = value + 1 == 3 ? 1 : "string"
  end
end

classe_a = A.new 1
puts classe_a.a.class # runtime type => String

classe_b = A.new(2)
puts classe_b.a.class # runtime type => Int32

puts typeof(classe_a.a) # compile-time type => Int32 | String (union of Int32 and String)

a = 0.as(Int32 | Nil | String)

class Foo
end

class Bar < Foo
end

class Baz < Foo
end

bar = Bar.new
baz = Baz.new
foo = rand < 0.5 ? bar : baz
puts typeof(foo) # Foo+, virtual type. O compilador vai ver esse tipo como o Parent (Foo) ou qualquer subtipo dele

t1 = {1, "hi"}    # Int32 | String
t2 = {false, nil} # Bool | Nil
t3 = rand < 0.5 ? t1 : t2
puts typeof(t3) # Tuple(Int32 | Bool, String | Nil)

tn1 = {x: 1, y: "hi"}
tn2 = {y: true, x: nil}
tn3 = rand < 0.5 ? t1 : t2
puts typeof(t3) # NamedTuple(x: Int32 | Nil, y: String | Bool), o tipo é por key x e y no caso
