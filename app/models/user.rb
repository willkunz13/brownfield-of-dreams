class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :password_digest
  enum role: [:default, :admin]
  has_secure_password

	has_many :pursuits,  :foreign_key => 'predator_id',
                       :class_name => 'Friendship',
                       :dependent => :destroy
  has_many :preys,     :through => :pursuits
  has_many :escapes,   :foreign_key => 'prey_id',
                       :class_name => 'Friendship',
                       :dependent => :destroy
  has_many :predators, :through => :escapes
end
