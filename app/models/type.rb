class Type < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :pokemons, through: :slots
end
