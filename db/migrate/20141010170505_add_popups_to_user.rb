class AddPopupsToUser < ActiveRecord::Migration
  def change
    add_column :users, :popup, :integer, :array => true, default: []
  end
end
