require 'rails_helper'

RSpec.describe Api::V1::PokemonController do
  subject { send_request && response }

  let(:parsed_response) { JSON.parse(subject.body) }
  let(:expected_response) do
    [
      {
        'id' => pokemon.external_id,
        'name' =>pokemon.name,
        'types' => [
          {
            'id' => type.external_id,
            'name' => type.name,
            'slot' => pokemon.slots.first.slot
          }
        ]
      }
    ]
  end

  describe 'GET index' do
    let(:send_request) { get :index }

    context 'when no pokemons records found' do
      it 'returns empty response' do
        expect(parsed_response).to be_empty
      end
    end

    context 'when pokemons records present' do
      let(:pokemon) { FactoryBot.create(:pokemon) }
      let(:type) { FactoryBot.create(:type) }

      before { FactoryBot.create(:slot, pokemon: pokemon, type: type) }

      it 'returns pokemons JSON response' do
        expect(parsed_response).to eq expected_response
      end
    end
  end

  describe 'GET show' do
    context 'when pokemon not found' do
      let(:send_request) { get :show, params: { id: '1234' }, format: :json }

      it 'returns error response' do
        expect( parsed_response['errors'].first['status']).to eq '500'
      end
    end

    context 'when pokemon found' do
      let(:send_request) { get :show, params: { id: pokemon.external_id }, format: :json }
      let(:pokemon) { FactoryBot.create(:pokemon) }
      let(:type) { FactoryBot.create(:type) }

      before { FactoryBot.create(:slot, pokemon: pokemon, type: type) }

      it 'returns pokemon JSON response' do
        expect(parsed_response).to eq expected_response.first
      end
    end
  end
end
