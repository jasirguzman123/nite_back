class Establishment < ApplicationRecord
  has_many :events, as: :owner, dependent: :destroy

  validates :name, :address, presence: true
end
