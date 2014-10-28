class AddLastInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_in, :datetime, default: Time.now
  end
end
