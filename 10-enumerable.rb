# ENUMERABLES são um conjunto de métodos internos do Ruby que são incluídos tanto como parte de arrays quanto de hashes.

# Exemplo antes dos Enumerables:
# Fazer uma lista de convidados usando o array `friends`, mas não convidar Bryan:
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

invited_list # ['Sharon', 'Leo', 'Leila', 'Arun']

# Resolvendo o problema acima com SELECT
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.select { |friend| friend != 'Brian'}
# ["Sharon", "Leo", "Leila", "Arun"]

# Resolvendo com REJECT
friends.reject { |friend| friend == 'Brian'}
# ["Sharon", "Leo", "Leila", "Arun"]

# EACH: itera em um array e executa um bloco de código para CADA elemento dessa lista.
friends.each { |friend| puts "Hello, " + friend }
# Hello, Sharon
# Hello, Leo
# Hello, Leila
# Hello, Brian
# Hello, Arun
# ["Sharon", "Leo", "Leila", "Brian", "Arun"]

# |friend| --> block variable

# Se o bloco de código for maior, é melhor não escrever em uma única linha, mas usar `do...end`:
my_array = [1, 2]
my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end
# The new number is 2.
# The new number is 4.

# EACH também funciona com hashes com um pouco mais de funcionalidades adicionadas:
my_hash = { "one" => 1, "two" => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}"}
# one is 1
# two is 2

my_hash.each { |pair| puts "the pair is #{pair}" }
# the pair is ["one", 1]
# the pair is ["two", 2]]

# EACH não muda o hash original!!!

# EACH_WITH_INDEX: quase a mesma coisa do `each`, mas fornece funcionalidades adicionais com duas `block variables` em vez de apenas uma.
fruits = ['apple', 'banana', 'strawberry', 'pineapple']
fruits.each_with_index { |fruit, index| puts fruit if index.even? }
# apple
# strawberry

# MAP: também chamado de `collect`, transforma cada elemento de um array de acordo com o bloco de código que você passar e retorna os elementos transformados (diferente do EACH, que retorna o array original)
friends.map { |friend| friend.upcase }
# ["SHARON", "LEO", "LEILA", "BRIAN", "ARUN"]

# Usando `map` com `gsub` para mudar apenas um trecho de um elemento:
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
my_order.map { |item| item.gsub('medium', 'extra large')}
# ["extra large Big Mac", "extra large fries", "extra large milkshake"]

salaries = [1200, 1500, 1100, 1800]
salaries.map { |salary| salary - 700 }
# [500, 800, 400, 1100]

# SELECT: também chamado de `filter`, passa por cada item do array e retorna um novo array apenas com os itens que são avaliados como `true` na condição estipulada
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes'}
p responses.select { |person, response| response == 'yes'} # {"Sharon"=>"yes", "Arun"=>"yes"}

# REDUCE: também chamado de `inject`, reduz um array ou hash para um único objeto ou um único valor
my_numbers = [5, 6, 7, 8]
sum = 0
my_numbers.each { |number| sum += number }
sum # 26

# Mesmo exemplo acima com `reduce`
my_numbers.reduce { |sum, number| sum + number} # 26
# A primeira block variable é o **acumulador**.
# O resultado de cada iteração é guardada no acumulador e passado para a próxima iteração.
# O acumulador é o valor retornado pelo `reduce`.
# O valor inicial do acumulador é, por padrão, o primeiro elemento da coleção:
# Iteração 0: sum = 5 + 6 = 11
# Iteração 1: sum = 11 + 7 = 18
# Iteração 2: sum = 18 + 8 = 26

# Setando um valor inicial diferente:
my_numbers.reduce(1000) { |sum, number| sum + number } # 1026

# Outro exemplo
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
# {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
# `Hash.new(0)` é o novo valor inicial do acumulador
# Iteração 0: result = {}
# O valor padrão foi definido como 0, então:
# `result["Bob's Dirty Burger Shack" == 0]` e `result["St.s Mark's Bistro" == 0]`
# Iteração 1: `result["Bob's Dirty Burger Shack"] += 1`
# Iteração 2: `result["St.s Mark's Bistro"] += 1`
# Iteração 3: `result["Bob's Dirty Burger Shack"] += 1`

# BANG METHODS: métodos como `map` e `select` não modificam os arrays originais. Mas caso esse seja o seu objetivo, basta usá-los como `map!` ou `select!`

# RETORNANDO VALORES DE ENUMERABLES
# Salvando o valor em uma variável local:
invited_friends = friends.select { |friend| friend != 'Brian' }

friends # ["Sharon", "Leo", "Leila", "Brian", "Arun"]

invited_friends # ["Sharon", "Leo", "Leila", "Arun"]

# Envolvendo o enumerable em uma definição de método
def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end

p invited_friends(friends) # ["Sharon", "Leo", "Leila", "Arun"]