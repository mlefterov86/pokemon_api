class Api::V1::PokemonController < Api::V1::BaseController
  def index
  end

  def show

  end

  def consume_pokemons_data
    response = FetchPokemonData.call
    render json: response, status: :ok
  rescue => e
    raise ApiExceptions::Base, detail: e.message
  end
end
