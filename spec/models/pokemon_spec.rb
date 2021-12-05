require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  subject(:pokemon) { FactoryBot.build(:pokemon) }

  it { is_expected.to have_many(:slots).dependent(:destroy) }
  it { is_expected.to have_many(:types).through(:slots) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:external_id) }
  it { is_expected.to validate_uniqueness_of(:url).case_insensitive }
end
