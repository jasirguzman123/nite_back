class Event < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :localities, dependent: :destroy
  has_many :event_participations, dependent: :destroy
  has_many :user_follows, as: :followee, dependent: :destroy
  has_many_attached :images

  enum status: %i[active closed canceled]

  def starting_price
    localities.order(:price).first&.price
  end

  def followers
    User.joins(:user_follows).where('followee_type = ? AND followee_id = ?', 'Event', id)
  end
end
