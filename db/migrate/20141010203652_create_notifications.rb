class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :message
      t.boolean :isRead, default: false
      t.integer :gold

      t.timestamps
    end
  end
end
