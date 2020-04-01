class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :password_digest
  enum role: [:default, :admin]
  has_secure_password

	has_many :friends_added, foreign_key: 'friender_id',
										 			 class_name: 'Friendship',
										 			 dependent: :destroy
	has_many :friendees, through: :friends_added
	has_many :added_by, foreign_key: 'friendee_id',
										  class_name: 'Friendship',
										  dependent: :destroy
	has_many :frienders, through: :added_by
end
