require 'rails_helper'

RSpec.describe Slot, type: :model do
  subject(:slot) { FactoryBot.create(:slot) }
  let(:pokemon) { FactoryBot.build(:pokemon) }
  let(:type) { FactoryBot.build(:type) }

  it { is_expected.to belong_to(:pokemon) }
  it { is_expected.to belong_to(:type) }
  it { is_expected.to validate_presence_of(:slot) }
  it { is_expected.to validate_numericality_of(:slot) }
end
