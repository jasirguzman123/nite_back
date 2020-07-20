class Establishment < ApplicationRecord
  has_many :events, as: :owner, dependent: :destroy

  validates :name, :address, presence: true

  def categories
    events.map(&:categories).flatten.uniq
  end
end
