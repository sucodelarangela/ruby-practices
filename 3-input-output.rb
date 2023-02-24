# SAÍDA DE DADOS NO TERMINAL (OUTPUT)
print 'Learning Ruby is FUN!'
print '1234'
puts 'Learning to code is cool!'
puts 'My name is Angela! :)'

# print e puts tem comportamentos similares, porém puts coloca cada resultado em uma única linha enquanto print coloca tudo em uma linha só. Usaremos ; para enfatizar esse exemplo:

print "Hello World"; print "I love drinking coffee"
# Hello WorldI love drinking coffee

puts "Hello World"; puts "I love drinking coffee"
# Hello World
# I love drinking coffee

# O ; é raramente usado no Ruby e pouco recomendado. Ele permite que você escreva mais de uma expressão na mesma linha.

# ENTRADA DE DADOS PELO TERMINAL (INPUT)
# gets para o programa e espera o input do usuário no terminal.
string_one = gets
puts string_one

# O comando gets sempre traz \n ao final do resultado, levando a quebra de linhas. #chomp é um método para evitar esse separador
string_two = gets.chomp
puts string_two