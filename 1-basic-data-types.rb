# ===== NUMBERS =====
# Ruby tem todos os operadores matemáticos típicos:
1 + 1 # Adição
2 - 1 # Subtração
2 * 2 # Multiplicação
10 / 5 # Divisão
3 ** 4 # Expoente
8 % 2 # Módulo - sem resto
10 % 4 # Módulo - com resto de 2

# Contas com inteiros (integers) sempre resultam em um inteiro
17 / 5 # 3, não 3.4

# Para resultados flutuantes (floats), um dos números deve ser flutuante
17 / 5.0 # 3.4

# Convertendo integer para float
13.to_f # 13.0

# Convertendo float para integer
13.0.to_i # 13
13.9.to_i # 13

# Métodos úteis para números: par ou ímpar
6.even? # true
7.even? # false
6.odd? # false
7.odd? # true

# ===== STRING =====
# Concatenação com plus operator
"Welcome " + "to " + "Ruby!"

# Concatenação com shovel operator
"Welcome " << "to " << "Ruby!"

# Concatenação com método concat
"Welcome ".concat("to ").concat("Ruby!")

# Acessando strings dentro de strings
"hello"[0] # h
"hello"[0..1] # he
"hello"[0, 4] # hell
"hello"[-1] # o

# Escapando caracteres (só funciona em strings com aspas duplas):
# \\  # Backslash
# \b  # Backspace
# \r  # Carriage return, for those of you that love typewriters
# \n  # Newline. You'll likely use this one the most.
# \s  # Space
# \t  # Tab
# \"  # Double quotation mark
# \'  # Single quotation mark

# Interpolação (só funciona com aspas duplas)
name = "Angela"
"Hello, #{name}" # Hello, Angela
'Hello, #{name}' # Hello, #{name}

# Métodos comuns de string
# Iniciais maiúsculas
"hello".capitalize # Hello

# Checar se a string inclui os parâmetros
"hello".include?("lo") # true
"hello".include?("z") # false

# Caixa alta e caixa baixa
"hello".upcase # HELLO
"Hello".downcase # hello

# Checa se a string está vazia
"hello".empty? # false
"".empty? # true

# Checa o comprimento da string
"hello".length # 5

# Reverte a ordem da string
"hello".reverse # olleh

# Separa a string
"hello world".split # no espaço em branco: [hello, world]
"hello".split("") # em cada caractere: [h, e, l, l, o]

# Remove os espaços em branco antes e depois da string
" hello, world   ".strip # "hello, world"

# Substituindo caracteres
"he77o".sub("7", "l") # primeiro encontrado: "hel7o"
"he77o".gsub("7", "l") # todos: "hello"

# Inserindo caracteres ou strings
"hello".insert(-1, " dude") # "hello dude"
"!".prepend("hello ", "world") # "hello world!"

# Deletando caracteres
"hello world".delete("l") # "heo word"

# Convertendo outros objetos em strings
5.to_s # "5"
nil.to_s # "" (nil = nothing)
:symbol.to_s # "symbol"

# SYMBOLS
# Sempre que strings são usadas, Ruby a armazena na memória, mesmo que uma string com o mesmo valor já exista. Symbols, por outro lado, são armazenados na memória apenas uma vez, tornado-os mais rápidos em algumas situações.
"string" == "string" # true: valores iguais
# object_id retorna um integer identificador de um objeto. E tudo em Ruby é um objeto
"string".object_id == "string".object_id # false: valores iguais, mas ids diferentes
:symbol.object_id == :symbol.object_id # true