class Api::V1::PokemonController < Api::V1::BaseController
  def index
    render json: pokemons, each_serializer: PokemonSerializer
  end

  def show
    pokemon = pokemons.find_by!(external_id: external_id)
    render json: pokemon, serializer: PokemonSerializer
  rescue => e
    raise ApiExceptions::Base, detail: e.message
  end

  def consume_pokemons_data
    response = FetchPokemonData.call
    render json: response, status: :ok
  rescue => e
    raise ApiExceptions::Base, detail: e.message
  end

  private

  def pokemons
    @pokemons = Pokemon.includes(:types)
  end

  def external_id
    params[:id]
  end
end
