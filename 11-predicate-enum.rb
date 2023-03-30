# INCLUDE?: Usado quandoc queremos saber se um elemento existe em um array.
# Exemplificando com `each`:
numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end

result

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end

result # false

# Exemplo usando `include?`
numbers.include?(6) # true
numbers.include?(3) # false

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = friends.select { |friend| friend != 'Brian' }
invited_list.include?('Brian') # false

# ANY?: Retorna `true` se QUALQUER elemento em um array ou hash respeita a condição dentro do bloco:
# Exemplo usando `each`:
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
  end
end

result # true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
  end
end

result # false

# Exemplo com `any?`
numbers.any? { |number| number > 500 } # true
numbers.any? { |number| number < 20 } # false

# ALL?: Só retorna `true` se TODOS os elementos no array ou hash respeitarem a condição no bloco.
# Exemplo usando `each`
fruits = ['apple', 'banana', 'strawberry', 'pineapple']
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end
  
  result = fruits.length == matches.length
end

result # true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end

result # false

# Exemplo usando `all?`
fruits.all? { |fruit| fruit.length > 3 } # true
fruits.all? { |fruit| fruit.length > 6 } # false

# NONE?: é o contrário de `all?`, retornando `true` apenas se a condição do bloco não encontrar NENHUM elemento do array ou hash.
# Exemplo com `each`:
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 10
    matches.push(fruit)
  end

  result = matches.length == 0
end

result # true

matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = matches.length == 0
end

result # false

# Exemplo usando `none?`
puts fruits.none? { |fruit| fruit.length > 10 } # true
puts fruits.none? { |fruit| fruit.length > 6 } # false