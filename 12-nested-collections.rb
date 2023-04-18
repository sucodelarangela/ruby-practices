# NESTED ARRAYS
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81],
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

# Acessando elementos
teacher_mailboxes[0][0] # "Adams"
teacher_mailboxes[1][0] # "Jones"
teacher_mailboxes[2][0] # "Perez"

# Índices negativos retornam elementos do final do array, começando em [-1]
teacher_mailboxes[0][-1] # "Davis"
teacher_mailboxes[-1][0] # "Perez"
teacher_mailboxes[-1][-2] # "Smith"

# Acessar índices de elementos aninhados não existentes gera um `NoMethodError`, porque a classe `nil` não tem um método []
# teacher_mailboxes[3][0] # NoMethodError pois só temos até o índice 2

# Acessar um índice inexistente dentro de um elemento aninhado existente, retorna `nil`
teacher_mailboxes[0][4] # nil

# Para retornar `nil` nos casos acima, utilizamos o método `dig`
teacher_mailboxes.dig(3, 0) # nil
teacher_mailboxes.dig(0, 4) # nil

# CRIANDO NESTED ARRAYS
# Criar arrays com o método `Array.new(initial size, default value)` só aceita como segundo argumento objetos imutáveis, como `number`, `boolean` ou `symbol`. Se usarmos string, array, hash ou outro objeto mutável faz com que todos os elementos do array sejam mudados quando você muda apenas um dos elementos
mutable = Array.new(3, Array.new(2)) # [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
mutable # [[1000, nil], [1000, nil], [1000, nil]]

# Sendo assim, devemos criar um nested array omitindo o segundo argumento opcional e passando-o dentro de um bloco {}:
immutable = Array.new(3) { Array.new(2) } # [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
immutable # [[1000, nil], [nil, nil], [nil, nil]]

# ADICIONANDO E REMOVENDO ELEMENTOS
# Podemos adicionar usando o método `push` ou o shovel operator `<<`. Para adicionarmos em um nested array, devemos indicar o índice do mesmo:
test_scores << [1000, 99, 98, 97]
# [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100) # [97, 76, 79, 93, 100]
test_scores
# [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

# Usando sintaxe similar, podemos remover elementos com `pop`
test_scores.pop # [100, 99, 98, 97]
test_scores[0].pop # 100
test_scores
# [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

# ITERANDO EM UM NESTED ARRAY
# Exemplo com `each_with_index`
teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row: #{row_index} = #{row}"
end
# Row: 0 = ["Adams", "Baker", "Clark", "Davis"]
# Row: 1 = ["Jones", "Lewis", "Lopez", "Moore"]
# Row: 2 = ["Perez", "Scott", "Smith", "Young"]

# Para conseguir iterar em elementos individuais em cada linha, você precisa aninhar outro método:
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row: #{row_index} Column: #{column_index} = #{teacher}"
  end
end
# Row: 0 Column: 0 = Adams
# Row: 0 Column: 1 = Baker
# Row: 0 Column: 2 = Clark
# Row: 0 Column: 3 = Davis
# Row: 1 Column: 0 = Jones
# Row: 1 Column: 1 = Lewis
# Row: 1 Column: 2 = Lopez
# Row: 1 Column: 3 = Moore
# Row: 2 Column: 0 = Perez
# Row: 2 Column: 1 = Scott
# Row: 2 Column: 2 = Smith
# Row: 2 Column: 3 = Young

# Se precisarmos apenas do nome de cada professor, podemos usar o método `flatten` antes de iterar:
teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end
# Adams is amazing!
# Baker is amazing!
# Clark is amazing!
# Davis is amazing!
# Jones is amazing!
# Lewis is amazing!
# Lopez is amazing!
# Moore is amazing!
# Perez is amazing!
# Scott is amazing!
# Smith is amazing!
# Young is amazing!

# EXEMPLO MAIS COMPLEXO
test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
# O exemplo acima retorna `false` pois não temos nenhum nested array com todas as notas acima de 80

test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end
# O exemplo acima retorna `true` pois validamos que todos os nested arrays tem algum número acima de 80

# NESTED HASHES
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"},
}

# Acessando dados: basta chamar `hash[:x][:y]`, onde `:x` é a chave da hash e `:y` é a chave do hash aninhado
vehicles[:alice][:year] # 2019
vehicles[:blake][:make] # "Volkswagen"
vehicles[:caleb][:model] # "Accord"

# Similar a arrays, tentar acessar uma chave inexistente retorna o erro `NoMethodError`, então é recomendado usar o método `nil`
vehicles[:zoe][:year] # NoMethodError
vehicles.dig(:zoe, :year) # nil
vehicles[:alice][:color] # nil
vehicles.dig(:alice, :color) # nil

# Adicionando e removendo dados
# Adicionando um novo elemento
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
vehicles # {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

# Adicionando um novo elemento à um hash aninhado:
vehicles[:dave][:color] = "red"
vehicles # {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

# Deletando dados
vehicles.delete(:blake)
vehicles # {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

# Deletando um par chave/valor dentro de um hash aninhado
vehicles[:dave].delete(:color)
vehicles # {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

# MÉTODOS DE NESTED COLLECTIONS
# SELECT: seleciona a hash que passa pelo filtro dentro do bloco de escopo
vehicles.select { |name, data| data[:year] >= 2020 }
# Retorna {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

# COLLECT: similar ao `map`, retorna o VALOR de cada iteração, e não o elemento aninhado inteiro
vehicles.collect { |name, data| name if data[:year] >= 2020 } # [nil, :caleb, :dave]

# No caso acima, recebemos um `nil`, o que pode gerar problemas futuros. Para isso, há o método `compact` que retorna o array ou hash sem os valores `nil`:
vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact # [:caleb, :dave]

# FILTER_MAP: combina a ação acima onde combinamos `collect` e `compact`
vehicles.filter_map { |name, data| name if data[:year] >= 2020 } # [:caleb, :dave]
