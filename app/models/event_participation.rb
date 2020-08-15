class EventParticipation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :locality, optional: true

  enum nature: %i[purchase assistance stored]

  validates :event_id, uniqueness: { scope: %i[user nature] }
end
