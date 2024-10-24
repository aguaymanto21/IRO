class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :name, presence: true
  validates :bio, presence: true

end
