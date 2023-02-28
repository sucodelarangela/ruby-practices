# CRIANDO ARRAYS
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]

# Arrays também podem ser criados com o método Array.new que pode receber dois argumentos: tamanho inicial e valor padrão:
Array.new # []
Array.new(3) # [nil, nil, nil]
Array.new(3, 7) # [7, 7, 7]
Array.new(3, true) # [true, true, true]

# ACESSANDO ELEMENTOS NO ARRAY
str_array[0] # "This"
str_array[1] # "is"
str_array[4] # "array"
str_array[-1] # "array"
str_array[-2] # "small"

# Array.first: retorna o(s) primeiro(s) elemento(s) do array
# Array.last: retorna o(s) último(s) elemento(s) do array
str_array.first # "This"
str_array.first(2) # ["This", "is"]
str_array.last(2) # ["small", "array"]

# ADICIONANDO OU REMOVENDO ELEMENTOS
# push ou << (shovel operator): adiciona elementos ao FINAL do array e retorna o array com os novos elementos
# pop remove o ÚLTIMO elemento do array e retorna o elemento removido
num_array = [1, 2]
num_array.push(3, 4) # [1, 2, 3, 4]
num_array << 5 # [1, 2, 3, 4, 5]
num_array.pop # 5
num_array # [1, 2, 3, 4]

# shift remove elementos do COMEÇO do array e retorna o elemento removido
# unshift adiciona elementos no começo do array e retorna o array com os novos elementos
num_array.unshift(1) # [1, 1, 2, 3, 4]
num_array.shift # 1
num_array # [1, 2, 3, 4]

# pop e shift podem receber argumentos no formato integer
num_array = [1, 2, 3, 4, 5, 6]

num_array.pop(3) # [4, 5, 6]
num_array.shift(2) # [1, 2]
num_array # 3

# ADICIONANDO E SUBTRAINDO ARRAYS
# Ao somar dois arrays, estes são concatenados em um único array. O método concat funciona da mesma forma
a = [1, 2, 3]
b = [3, 4, 5]

a + b # [1, 2, 3, 3, 4, 5]
a.concat(b) # [1, 2, 3, 3, 4, 5]

# Ao subtrair arrays, Ruby retorna uma cópia do primeiro array removendo os elementos que aparecem no segundo array
[1, 1, 1, 2, 2, 3, 4] - [1, 4] # [2, 2, 3]

# Para listar os métodos disponíveis para arrays
num_array.methods

[].empty? # true
[[]].empty? # false
[1, 2].empty? # false

[1, 2, 3].length # 3

[1, 2, 3].reverse # [3, 2, 1]

[1, 2, 3].include?(3)   # true
[1, 2, 3].include?("3") # false

[1, 2, 3].join          # "123"
[1, 2, 3].join("-")     # "1-2-3"