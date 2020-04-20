class Event < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :localities, dependent: :destroy
  has_many :event_participations, dependent: :destroy

  enum status: %i[active closed canceled]

  def starting_price
    localities.order(:price).last&.price
  end
end
