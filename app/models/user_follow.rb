class UserFollow < ApplicationRecord
  belongs_to :user
  belongs_to :followee
end
