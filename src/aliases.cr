# https://crystal-lang.org/reference/1.9/syntax_and_semantics/alias.html

alias PInt32 = Pointer(Int32)

pointer_int = PInt32.malloc(1) # ? tamanho dos bytes
p! pointer_int.value

# * invés de escrever Array(Int32) | Array(String) toda vez do tipo, colocar isso num alias
alias CustomArray = Array(Int32) | Array(String)
