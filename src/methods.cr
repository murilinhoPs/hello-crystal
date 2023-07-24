def say_hello(recipient)
"Hello #{recipient}!"
end
puts say_hello "Hello"

def say_hello_default(recipient = "World")
  puts "Hello #{recipient}!"
end
say_hello_default
say_hello_default "Not default"

def say_hello_typed(recipient : String) # only receives String
  puts "Hello #{recipient}!"
end
say_hello_typed "Murilo"

# methods overload
def say_hello_over(recipient : String)
  puts "Hello #{recipient}!"
end

def say_hello_over(times : Int32)
  puts "Hello! " * times
end
say_hello_over "World"
say_hello_over 3

# always return the value of the last expression of the method
def adds_3(n : Int32)
   return n + 3
end
def adds_2(n : Int32) : Int32
    n + 2 # é o mesmo que return n + 2
end
puts adds_2 40
puts adds_3 40


