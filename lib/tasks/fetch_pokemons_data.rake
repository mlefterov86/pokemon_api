desc 'Fetches Pokemons and types'
task :fill_pokemon_database, [] => :environment do
  FetchPokemonData.call
end
