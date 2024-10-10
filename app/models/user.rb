class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :achievements
  has_many :friendships
  has_many :profiles

  has_many :friends, through: :friendships, source: :friend
  has_many :profiles, dependent: :destroy
  has_many :support_groups
  has_many :connections
  has_many :group_members, through: :connections, source: :user

  def initials
    email.split('@').first[0, 2].upcase
  end


end
