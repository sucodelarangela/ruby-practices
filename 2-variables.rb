# criando variáveis
age = 18 # 18
age = 18 + 5 # 23

# É possível reatribuir o valor de uma operação à mesma variável
age = age + 4 # 27
age += 4 # 31

# Outros operadores similares ao acima:
age -= 2 # 29
age *= 2 # 58
age /= 10 # 5

# É boa prática escrever nomes de variáveis com snake_case. Exemplos de nomes de variáveis:
# Ruins:
a = 19
string = 'John'
# Bons:
age = 19
name = 'John'
can_swim = false

# Variáveis é uma referência para um espaço no memória onde seu valor fica salvo. No exemplo abaixo, ambas as variáveis apontam para onde "Barcelona" está salvo na memória:
desired_location = 'Barcelona' # Barcelona
johns_location = desired_location # Barcelona
johns_location.upcase!
puts desired_location # BARCELONA
puts johns_location # BARCELONA
# Atribuir a uma variável à outra variável pode ter efeitos colaterais. Nesse caso, ao colocar 'johns_location' em upcase, o valor original também foi alterado.