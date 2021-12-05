Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :consume_pokemons_data, to: 'pokemon#consume_pokemons_data'
      resources :pokemon, only: %I(index show) do
      end
    end
  end
end
