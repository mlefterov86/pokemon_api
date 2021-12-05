FactoryBot.define do
  factory :pokemon do
    sequence(:name) { |n| "pokemon_#{n}" }
    sequence(:url) { |n| "pokemon_api/pokemon/#{n}" }
    sequence(:external_id) { |n| n }
  end
end
