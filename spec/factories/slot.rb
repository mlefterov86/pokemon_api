
FactoryBot.define do
  factory :slot do
    sequence(:slot) { |n| n }
    pokemon
    type
  end
end
