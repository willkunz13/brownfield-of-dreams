# frozen_string_literal: true

class Friendship < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :predator, class_name: 'User'
  belongs_to :prey, class_name: 'User'
end
