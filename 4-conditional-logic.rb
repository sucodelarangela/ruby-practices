# Qualquer declaração condicional sempre terá uma expressão que é avaliada como `true` ou `false`.
#  Os únicos valores falsos em Ruby são `nil` e `false`. Diferente de outras linguagens, o número 0 ou uma string vazia ("") em Ruby não são equivalentes a `false`.

# IF
if 1 < 2
  puts "Hot diggity, 1 is less than 2!"
end

# se houver apenas uma linha de código para ser avaliada no bloco, você pode reescrever o IF assim (sem precisar de 'end'):
puts "Hot diggity, 2 is less than 3!" if 2 < 3

# ELSE e ELSIF
attack_by_land = true
attack_by_sea = false
if attack_by_land == true
  puts 'release the goat'
else
  puts 'release the shark'
end

if attack_by_land == true
  puts 'release the goat'
elsif attack_by_sea == true
  puts 'release the shark'
else
  puts 'release Kevin the octopus'
end

# LÓGICA BOOLEANA: comparadores
# == (igual) retorna `true` se todos forem iguais
5 == 5 # true
6 == 6 # true

# != (not equal) retorna `true` se todos forem diferentes
5 != 7 #true
5 != 5 #false

# > (greater than) retorna `true` se o valor da esquerda for maior que o da direita
7 > 5 # true
5 > 7 # false

# < (less than) retorna `true` se o valor da esquerda for menor que o da direita
5 < 7 # true
7 < 5 # false

# >= (greater than or equal to) retorna `true` se o valor da esquerda for maior que ou igual ao da direita
7 >= 7 # true
7 >= 5 # true

# <= (less than or equal to) retorna `true` se o valor da esquerda for menor que ou igual ao da direita
5 <= 5 # true
5 <= 7 # true

# .eql? checa se ambos os valores são do MESMO TIPO
5.eql?(5.0) # false, pois são tipos diferentes (integer vs float)
5.eql?(5) # true

# .equal? checa se ambos os valores são o mesmo objeto na memória. Geralmente variáveis apontando para o mesmo número retornam `true`, devido à forma como os computadores armazenam inteiros na memória. O mesmo não acontece com strings:
a = 5
b = 5
a.equal?(b) # true

c = 'hello'
d = 'hello'
c.equal?(d) # false

# SPACESHIP OPERATOR: operador especial que retorna -1 se o valor da esquerda for menor, 0 se forem iguais, ou 1 se o valor da esquerda for maior
5 <=> 10 # -1
10 <=> 10 # 0
10 <=> 5 # 1

# OPERADORES LÓGICOS
# && (and) retorna `true` se ambas as expressões retornarem `true`
if 1 < 2 && 5 < 6
  puts "Party at Kevin's"
end
# Também pode ser escrito como:
if 1 < 2 and 5 < 6
  puts "Party at Kevin's"
end

# || (or) retorna `true` se uma das expressões for `true`. Se a primeira expressão retornar true, a segunda nem é avaliada
if 10 < 2 || 5 < 6
  puts "Party at Kevin's"
end
# Também pode ser escrito como:
if 10 < 2 or 5 < 6
  puts "Party at Kevin's"
end

# ! (not) retorna `true` se toda a expressão retornar `false`
puts !false # true
puts !(10 < 5) # true

# CASE STATEMENTS (similar a SWITCH/CASE no JS)
# usado para substituir vários IF/ELSIF
grade = "F"

# Cria uma variável `did_i_pass` e atribui a ela o case que se aplica de acordo com a nota acima
puts did_i_pass = case grade
when "A" then "Hell yeah!"
when "D" then "Don't tell mother"
else "'YOU SHALL NOT PASS! - Gandalf'"
end

# Se for mais complexo, pode-se omitir o `then` e escrever o bloco de código na linha seguinte:
case grade
when "A"
  puts "You're a genius!"
  future_bank_account_balance = 5_000_000
when "D"
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS! - Gandalf"
  fml = true
end

# UNLESS STATEMENTS
# Trabalham da forma oposta ao IF: somente processa o código no bloco se a expressão for avaliada como `false`
age = 19
unless age < 18
  puts 'Get a job'
end

# Também pode ser escrito em uma única linha e com ELSE, como o IF
puts 'Welcome to a ife of debt.' unless age < 18

unless age < 18
  puts 'Down with that sort of thing'
else
  puts 'Careful now!'
end

# A declaração `unless` deve ser usada quando você quer que algo **não** seja executado se uma condição for `true`, porque isso deixa o código mais fácil de ler do que usando `if !true`

# OPERADOR TERNÁRIO: exatamente igual ao JS
puts response = age < 18 ? "You still have your entire life ahead of you" : "You're all grown up"