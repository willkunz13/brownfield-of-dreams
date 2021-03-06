# frozen_string_literal: true

class UserVideo < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :video, foreign_key: 'video_id'
  belongs_to :user, foreign_key: 'user_id'
end
