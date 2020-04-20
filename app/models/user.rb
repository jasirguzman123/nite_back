class User < ApplicationRecord
  has_secure_password

  has_many :events, as: :owner, dependent: :destroy
  has_many :event_participations, dependent: :destroy

  validates :email, :name, :last_name, :phone, :birthdate, presence: true
  validates :email, format: { with: /\A(^\S+)[@](\w+)(\.[a-zA-Z0-9]+)+\z/ }, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true

  def full_name
    "#{name} #{last_name}"
  end
end
