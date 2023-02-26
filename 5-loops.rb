# LOOP define um loop infinito que só para quando você usa o comando `break` em conjunto com uma condição. Não é muito usado pois existem opções melhores.
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end

# WHILE é parecido com LOOP exceto que você declara a condição do break de imediato:
j = 0
while j < 10 do
  puts "j is #{j}"
  j += 1
end

while gets.chomp != "yes" do
  puts "Will you go to prom with me?"
end

# UNTIL é similar ao WHILE, porém o WHILE roda enquanto a condição for `true` e UNTIL roda enquanto a condição for `false`
k = 0
until k >= 10 do
  puts "k is #{k}"
  k += 1
end

until gets.chomp == "yes" do
  puts "Will you marry me?"
end

# RANGES
# Ruby permite usar intervalos quando sabemos quantas vezes queremos que o loop aconteça.
(1..5) # range inclusivo: 1, 2, 3, 4, 5
(1...5) # range exclusivo: 1, 2, 3, 4
('a'..'d') # a, b, c, d

# FOR: usado para iterar em uma coleção de informações, como um array ou um range:
for i in 0..5
  puts "#{i} zombies incoming!"
  # vai de 0 a 5
end

# TIMES: itera em um loop por uma determinada quantidade de vezes. Também permite acessar o número atual da iteração:
5.times do
  puts "Hello, dev!" # imprime 5 vezes
end

5.times do | number |
  puts "Alternative fact number #{number}"
  # imprime de 0 a 4 (5 vezes)
end

# UPTO e DOWNTO: são usados para iterar a partir de um número até outro número para cima ou para baixo
5.upto(10) {|num| print "#{num} "} # 5 6 7 8 9 10
10.downto(5) {|num| print "#{num} "} # 10 9 8 7 6 5