class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
