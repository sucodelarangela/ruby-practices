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
puts numbers.any? { |number| number > 500 } # true
puts numbers.any? { |number| number < 20 } # false