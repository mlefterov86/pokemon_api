class Pokemon < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :types, through: :slots
end
