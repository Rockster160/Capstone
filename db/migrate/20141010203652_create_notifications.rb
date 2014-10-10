class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :userid
      t.string :message
      t.boolean :isRead, default: false
      t.integer :gold

      t.timestamps
    end
  end
end
