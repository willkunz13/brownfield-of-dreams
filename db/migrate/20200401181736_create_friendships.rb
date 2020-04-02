# rubocop:todo Style/Documentation
# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.bigint :predator_id
      t.bigint :prey_id

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
