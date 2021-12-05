class Slot < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type

  validates :slot, presence: true, numericality: { only_integer: true }
end
