class EventParticipation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :locality, optional: true

  enum nature: %i[purchase assistance stored]

  validates :event_id, uniqueness: { scope: %i[user nature] }, unless: :purchase?

  before_validation :generate_voucher_code, on: :create

  private

  def generate_voucher_code
    loop do
      self.voucher_code = SecureRandom.hex(5)
      break unless EventParticipation.exists? voucher_code: voucher_code
    end
  end
end
