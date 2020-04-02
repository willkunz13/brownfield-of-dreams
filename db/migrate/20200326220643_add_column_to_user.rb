# rubocop:todo Style/Documentation
# frozen_string_literal: true

class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_column :users, :token, :string
  end
end
# rubocop:enable Style/Documentation
