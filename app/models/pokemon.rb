class Pokemon < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :types, through: :slots

  validates :name, :url, :external_id, presence: true
  validates_uniqueness_of :url
end
