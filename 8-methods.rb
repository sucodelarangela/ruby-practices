# Com Ruby é possível criar seus próprios métodos com a palavra-chave `def`
def my_name
  "Angela Caldas" # ou `return "Angela Caldas"`
end

my_name # "Angela Caldas"

# `def`: palavra-chave que indica ao Ruby o começo da declaração de um método
# my_name: nome do método
# "Angela Caldas": código do corpo do método, onde toda a lógica deve ser contida.
# end: palavra-chave que indica ao Ruby o fim da declaração do método

# A convenção é usar snake_case para o nome dos métodos. Também é possível usar `_`, `?`, `!` e `=`

# O que não é permitido em nomes de métodos:
# Palavras reservadas, como `end`, `while` ou `for`, entre outros;
# Símbolos diferentes dos indicados na linha 13;
# `?`, `!` e `=` só podem ser usados no final do nome;
# Iniciar o nome do método com um número.

# method_name # ok
# _name_of_method # not ok
# 1_method_name # not ok
# method_27 # ok
# method?_name # not ok
# method_name! # ok
# begin # not ok (palavra reservada)
# begin_count # ok

# PARÂMETROS E ARGUMENTOS
# `name`: parâmetro
def greet(name)
  "Hello, " + name + "!"
end

# `my_name`: argumento
greet(my_name) # "Hello, Angela Caldas!"

# Parâmetros agem como um placeholder no template do método
# Argumentos são os valores que são, de fato, passados ao usar o método

# Podemos usar parâmetros default
def greet2(name = "stranger")
  "Hello, " + name + "!"
end

greet2 # "Hello, stranger!"

# RETURN
# Ruby oferece um `return` implícito, ou seja, o método retorna automaticamente a última expressão avaliada dentro do seu corpo. Porém, também é possível usar `return` explicitamente

# Aqui o `return` implicitamente retorna o resultado da avaliação do `if/else`
def even_odd(number)
  if number % 2 == 0
    "That is an even number"
  else
    "That is an odd number"
  end
end

even_odd(16) # "That is an even number"
even_odd(7) # "That is an odd number"

# `return` explícito tem prioridade sobre qualquer outra expressão, mesma que esta venha por último
def my_name
  return "Angela"
  "Tereza"
end

my_name # "Angela"

# `return` explícito é útil quando você quiser que um método verifique erros de entrada antes de continuar. No caso abaixo, a verificação que possui o `return` explícito será executada antes, obrigatoriamente:
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered"
  end

  if number % 2 == 0
    "That's an even number."
  else
    "That's an odd number."
  end
end

even_odd(20) # "That's an even number."
even_odd("Ruby") # "A number was not entered."

# PUTS VS RETURN
# Puts apenas imprime um valor no console
# Return faz o valor ser retornado do método

def puts_squared(number)
  puts number * number
end

# O exemplo acima imprime no console o resultado da operação, porém o método não retorna esse valor. Sendo assim:
puts_squared(20) # 400
x = puts_squared(20) # nil

# Usando o exemplo acima com um `return` implícito
def return_squared(number)
  number * number
end

x = return_squared(20) # 400
y = 100
sum = x + y # 500
puts "The sum of #{x} and #{y} is #{sum}." # "The sum of 400 and 100 is 500."

# Encadeamento de métodos
phrase = ["be", "to", "not", "or", "be", "to"]

phrase.reverse.join(" ").capitalize # "To be or not to be"

# Métodos predicados (predicate methods): métodos que terminam com `?`, padrão do Ruby para métodos que retornam um `boolean`
5.even? # false
6.even? # true
17.odd? # true
12.between?(10, 15) # true

# BANG METHODS: terminam com `!`. Esse símbolo indica ao Ruby que ele deve executar o método e substituir o valor original da variável (o que não acontece por padrão)
whisper = "HELLO EVERYBODY"

whisper.downcase # "hello everybody"
whisper # "HELLO EVERYBODY"

# No exemplo acima, o método `downcase` transforma a string em letras minúsculas, mas não substitui o valor original da variável `whisper`. Isso é uma regra geral da programação em que você não quer que os métodos sobrescrevam os objetos nos quais eles são usados. No entanto, se for uma necessidade, você pode reatribuir a variável (`whisper = whisper.downcase`) ou  usar BANG METHODS:

puts whisper.downcase! # "hello everybody" (seria equivalente à `whisper = whisper.downcase`)
puts whisper # "hello everybody"