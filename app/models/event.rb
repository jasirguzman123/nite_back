class Event < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :localities, dependent: :destroy
  has_many :event_participations, dependent: :destroy
  has_many :user_follows, as: :followee, dependent: :destroy
  has_many :attendant_participations, -> { assistance }, class_name: 'EventParticipation'
  has_many :attendants, through: :attendant_participations, source: :user
  has_many_attached :images
  has_one_attached :cover

  enum status: %i[active closed canceled]
  enum main_category: %i[bar concert sport restaurant party]

  validates :cover, :name, :address, :starting_hour, :description, :images, presence: true

  def starting_price
    localities.order(:price).first&.price
  end

  def followers
    User.joins(:user_follows).where('followee_type = ? AND followee_id = ?', 'Event', id)
  end
end
