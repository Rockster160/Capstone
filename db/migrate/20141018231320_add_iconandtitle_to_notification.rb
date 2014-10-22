class AddIconandtitleToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :title, :string
    add_column :notifications, :icon, :integer
  end
end
