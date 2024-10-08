class Message < ApplicationRecord
  belongs_to :user
  belongs_to :support_group
  validates :content, presence: true
end
