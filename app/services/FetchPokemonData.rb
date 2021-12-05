class FetchPokemonData
  class << self
    def call
      # to ensure script is storing data in DB
      clean_database

      store_pokemons!
      store_types!

      pokemon_count = Pokemon.count
      type_count = Type.count

      puts "#### Fetching Pokemons Done!!! ###"
      puts "#### #{pokemon_count} Pokemons stored in DB ###"
      puts "#### #{type_count} Pokemon types stored in DB"

      {
        "data" => [
          pokemons: pokemon_count,
          pokemon_types: type_count,
        ]
      }
    end

    private

    def clean_database
      Pokemon.destroy_all
      Type.destroy_all
    end

    def store_pokemons!
      response = connection.get('/pokemon')
      pokemons = JSON.parse(response.body)['results']
      pokemons.each do |pokemon|
        pokemon = Pokemon.find_or_initialize_by(url: pokemon['url']).tap do |record|
          record.name = pokemon['name']
          record.save!
        end
        fetch_pokemon_types!(pokemon)
      end
    end

    def fetch_pokemon_types!(pokemon)
      response = Faraday.get(pokemon.url)
      body = JSON.parse(response.body)

      pokemon.update!(external_id: body['id'])

      body['types'].each do |type|
        slot = type['slot'].to_i
        name = type['type']['name']
        url = type['type']['url']

        type = Type.find_or_initialize_by(name: name).tap do |record|
          record.url = url
          record.save!
        end
        pokemon.slots.create!(slot: slot, type: type)
      end
    end

    def store_types!
      response = connection.get('/type')
      types = JSON.parse(response.body)['results']
      types.each do |type|
        Type.find_or_initialize_by(name: type['name']).tap  do |record|
          record.url = type['url']

          # instead of doing another API request
          # to safe time we can parse type['url'] and extract id from it
          response = Faraday.get(type['url'])
          record.external_id = JSON.parse(response.body)['id']
          record.save!
        end
      end
    end

    def connection
      @connection ||= Connection.new
    end
  end
end
