class FetchPokemonData
  class << self
    def call
      store_pokemons!
      store_types!
    end

    private

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
      types = JSON.parse(response.body)['types']
      types.each do |type|
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
          record.save!
        end
      end
    end

    def connection
      @connection ||= Connection.new
    end
  end
end
