enum MyEnum
  Zero     #
  One      # 1
  Two      # 2
  Five = 5 # ?Ovewrite to 5
  Six      # 6 (5+1)
end

enum Color
  Red
  Green
  Blue
  Yellow

  def red? # ?Can create methods inside
    self == Color::Red
  end
end

p! Color::Red        # => Red
p! Color::Blue.value # => 2
puts Color.new(0)    # => Red
puts Color.new(8)    # *=> 8, se não existe ele printa o numero

def paint_enum(color : Color)
  case color
  when Color::Red
    puts "Color is #{Color::Red}"
  else
    # !exception se não existe o enum, o que é improvavel mas se passar new(10) vai cair nesse caso
    raise "unknown color: #{color}"
  end
end
paint_enum Color::Red 

def paint_symbol(color : Symbol) # ?Symbol é :symbol, como em clojure :property (sem tipagem)
  case color
  when :red
    puts "Symbol color is #{:red}"
  else
    raise "unknown color: #{color}"
  end
end
paint_symbol :red

@[Flags] # *Os proximos valores do enum depois do 1 são multiplicados por *2
enum IOMode
  Read   # 1 (initial)
  Write  # 2 (2*1)
  Delete # 4 (2*2)
end
p! IOMode::None.value # => 0
p! IOMode::All.value  # *=> 7 (soma todos)
