def pokemons_init(number)

  pokemons = []
  number.times do
    puts 'name and colour of pokemon:'
    name = gets.chomp
    colour = gets.chomp
    pokemon = {name=>colour}
    pokemons.push(pokemon)
  end
  pokemons
end

puts 'Number of pokemons: '
number = gets.chomp.to_i
puts(pokemons_init(number))

