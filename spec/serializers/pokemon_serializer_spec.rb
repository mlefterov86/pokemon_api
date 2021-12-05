require 'rails_helper'

RSpec.describe PokemonSerializer do
  subject(:serializer) { described_class.new(pokemon).serializable_hash }

  let(:pokemon) { FactoryBot.create(:pokemon) }
  let(:type) { FactoryBot.create(:type) }
  let(:types) do
    [
      { id: type.external_id, name: type.name, slot: pokemon.slots.first.slot }
    ]
  end

  before  { FactoryBot.create(:slot, pokemon: pokemon, type: type) }

  it { is_expected.to include(id: pokemon.external_id) }
  it { is_expected.to include(name: pokemon.name) }
  it { is_expected.to include(types: types) }
end
