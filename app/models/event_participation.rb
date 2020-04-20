class EventParticipation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :locality

  enum nature: %i[purchase assistance stored]
end
