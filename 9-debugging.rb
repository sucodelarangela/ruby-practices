require 'pry-byebug'

# DEBUGGING COM PUTS
def isogram? (string)
  original_length = string.length
  string_array = string.downcase.split
  # p string_array
  unique_length = string_array.uniq.length
  # puts unique_length
  original_length == unique_length
end

isogram?('Odin') # false, mas deveria ser true, porque 'Odin é, de fato, um isograma

# para debuggar, podemos usar `puts` ou simplesmente `p`, que é uma combinação de `puts` e `inspect`.

# Usaremos um deles na linha anterior ao retorno da função para saber o valor de `unique_length`.

# Nosso resultado foi `1`, o que nos leva a crer que o erro foi mais acima, pois sabemos que temos 4 caracteres únicos, mas nosso retorno foi `1`. Vamos tentar usar `puts` para o valor de `string_array`

# De fato, o erro foi em `string_array`, pois não usamos o método `split` corretamente. Quando usamos `split` sem argumentos, ele entende que deve dividir a `string` onde houver `whitespace`. Para corrigir, vamos usar `.split('')`:
def isogram? (string)
  original_length = string.length
  string_array = string.downcase.split('')
  # p string_array
  unique_length = string_array.uniq.length
  # puts unique_length
  original_length == unique_length
end

isogram?('Odin') # true


# DEBUGGING COM PUTS E NIL
puts "Using puts:" # Using puts:
puts [] # nada
p "Using p:" # "Using p:"
p [] # []

# O problema de usar `puts` é que, sempre que o valor de algo for `nil`, ele vai retornar uma linha em branco e não o valor ou o erro inspecionado. Isso enfatiza que `p` é melhor que `puts` para debugging

# DEBUGGING COM PRY-BYEBUG
# Pry é um pacote Ruby que fornece um REPL interativo enquanto seu programa estiver rodando.
# Para usá-lo, devemos instalá-lo com `gem install pry-byebug`. Depois, importamos ele na aplicação com `require 'pry-byebug` e usamos o método `binding.pry` em qualquer lugar do nosso código.
def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split

  binding.pry

  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")

# No exemplo acima, `original_length` e `string_array` estarão no escopo do Pry no terminal, mas o restante não, pois o que vem depois do pry não é avaliado. O Pry funciona como um breakpoint no JS.

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")