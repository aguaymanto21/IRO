class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :name, presence: true
  validates :bio, presence: true

  has_many :moods, dependent: :destroy
  has_many :achievements, dependent: :destroy
end
