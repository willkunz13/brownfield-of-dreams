class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.bigint :friender_id
      t.bigint :friendee_id

      t.timestamps
    end
  end
end
