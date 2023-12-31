module Foo
  class Bar
  end
end

Foo::Bar.new

module ItemsSize
  class SomeItem
  end

  def size
    items.size
  end

  def some_method
    1
  end
end

module RandomSize
  def random_size
    4
  end
end

class Items
  include ItemsSize # ?adiciona as funções do modulo na sua instancia
  extend RandomSize # ?adiciona as funções do modulo como class methdos

  def items
    [1, 2, 3]
  end
end

Items.random_size # => 4

items = Items.new
items.size # => 3

include ItemsSize

ItemsSize::SomeItem.new # *same as below
SomeItem.new            # *
some_method

module Extendido
  extend self

  def estendido(int)
  end
end

Extendido.estendido 2

include Extendido
estendido 2

module MyClass(T)
  def self.my_class
    puts T.class
    T
  end

  def self.my_class(x : T)
    puts x.class
    T
  end
end

MyClass(Int32).my_class # *preciso inferir o tipo se chamar o metodo sem o tipo
MyClass.my_class(1)
