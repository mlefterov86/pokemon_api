class Type < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :pokemons, through: :slots

  validates :name, :url, :external_id, presence: true
  validates_uniqueness_of :name, :url
end
