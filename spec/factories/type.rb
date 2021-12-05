FactoryBot.define do
  factory :type do
    sequence(:name) { |n| "pokemon_type_#{n}" }
    sequence(:url) { |n| "pokemon_api/type/#{n}" }
  end
end
