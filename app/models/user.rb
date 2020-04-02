class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :password_digest
  enum role: [:default, :admin]
  enum status: [:inactive, :active]
  has_secure_password
end
