class Pokemon < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :types, through: :slots

  validates :name, :url, presence: true
  validates_uniqueness_of :url
end
