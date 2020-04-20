class Locality < ApplicationRecord
  belongs_to :event
  has_many :event_participations, dependent: :destroy

end
