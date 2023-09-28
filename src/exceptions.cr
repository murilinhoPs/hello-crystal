# raise "Get an error!"                     # => unhandled exception
# raise Exception.new "Get a new exception" # => unhandled exception

class MyException < Exception # ? create custom exceptions, extends from Exception
end

class MyOtherException < Exception
end

# Exception block
begin
  raise "ERROR!"
rescue
  puts "Rescued!"
end

# * Will return the rescued exception message
begin
  raise "OH NO!"
rescue exception
  puts exception.message
end

# * will only rescue exceptions of type MyException
begin
  raise MyException.new "OH NO, MY exception!"
rescue exception : MyException
  puts exception.message
end

# ? exceptions blocks
begin
  # ...
rescue ex : MyException | MyOtherException
  # only MyException or MyOtherException
rescue ex
end

puts "------Else and Ensure-------"

begin
  # ...
rescue ex
  # exception.message
else
  # se nenhuma exception foi resgatada (rescued)
end

begin
  # something
rescue ex
  # ...
else
  # ...
ensure # * sempre vai ser chamado quando something for executado
  puts "Ensure called the method on begin"
end

# "------Short syntax in a method-------"
# * pode ser usado em blocks o rescue
def some_dangerous_method
  something_dangerous
rescue ex
  # ...
else
  # ...
ensure
  # ...
end

# "------Other ways-------"

array = [1, 2, 3]
array[4]  # raises because of IndexError
array[4]? # returns nil because of index out of bounds
