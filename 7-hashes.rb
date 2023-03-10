# Hashes são coleções de dados mais avançados que arrays, similares aos objetos em JavaScript e dicionários em Python

# Forma básica de criar uma hash, usando `{}`
# => chama-se hask rocket
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}

# Também é possível criar hashes com a palavra chave `new`
new_hash = Hash.new
new_hash # {}

hash = {9 => "nine", :six => 6}

# ACESSANDO VALORES
shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}

shoes["summer"] # "sandals"

# Ao retornar "nil", sua aplicação pode quebrar. Para isso, hashes possui um método `fetch` para ajudar a lidar com os erros
# shoes["hiking"] # nil
# shoes.fetch("hiking") # key not found: "hiking" (KeyError)

# Podemos atribuir um valor default de retorno no fetch, caso a chave solicitada não exista:
shoes.fetch("hiking", "hiking boots") # "hiking boots"

# ADICIONANDO E ALTERANDO DADOS
shoes["fall"] = "sneakers"
shoes # {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}

# Essa mesma tática é usada para modificar dados
shoes["summer"] = "flip-flops"
shoes # {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}

# REMOVENDO DADOS
shoes.delete("summer") # flip-flops
shoes # {"winter"=>"boots", "fall"=>"sneakers"}

# MÉTODOS => hashes respondem aos mesmos métodos de arrays. Também usa os métodos #keys e #values
books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

books.keys # ["Infinite Jest", "Into the Wild"]
books.values # ["David Foster Wallace", "Jon Krakauer"]

# UNINDO HASHES
hash1 = { "a" => 100, "b" => 200}
hash2 = { "b" => 254, "c" => 300}

hash1.merge(hash2) # {"a" => 100, "b" => 254, "c" => 300}
# No caso acima, o segundo valor de "b" sobrescreveu o primeiro valor.

# SYMBOLS como chaves de hashes
# Sintaxe rocket
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}

# Sintaxe symbols - essa é a forma mais usada, porém só funciona com symbols. Se você escrever, por exemplo, `{9: "value"}`
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

# Para acessar os valores como símbolos, ainda é necessário usar a sintaxe padrão, senão haverão erros:
puts american_cars[:ford] # "Mustang"
puts japanese_cars[:honda] # "Accord"