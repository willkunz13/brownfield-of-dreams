# frozen_string_literal: true

class Video < ApplicationRecord # rubocop:todo Style/Documentation
  has_many :user_videos
  has_many :users, through: :user_videos
  belongs_to :tutorial
end
