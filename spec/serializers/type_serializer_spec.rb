require 'rails_helper'

RSpec.describe TypeSerializer do
  subject(:serializer) { described_class.new(slot).serializable_hash }

  let(:pokemon) { FactoryBot.create(:pokemon) }
  let(:type) { FactoryBot.create(:type) }
  let(:slot) { FactoryBot.create(:slot, pokemon: pokemon, type: type) }

  it { is_expected.to include(id: type.external_id) }
  it { is_expected.to include(name: type.name) }
  it { is_expected.to include(slot: type.slots.first.slot) }
end
