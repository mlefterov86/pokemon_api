require 'rails_helper'

RSpec.describe Type, type: :model do
  subject(:type) { FactoryBot.create(:type) }

  it { is_expected.to have_many(:slots).dependent(:destroy) }
  it { is_expected.to have_many(:pokemons).through(:slots) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url).case_insensitive }
end
