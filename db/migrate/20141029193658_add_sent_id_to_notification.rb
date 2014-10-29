class AddSentIdToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :sent_id, :integer
  end
end
