class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, presence: true
  validates :friend_id, presence: true
  validate :cannot_friend_self
  validates :friend_id, uniqueness: { scope: :user_id, message: "You are already friends with this user" }

  private

  def cannot_friend_self
    errors.add(:friend_id, "You can't be friends with yourself") if user_id == friend_id
  end
end
