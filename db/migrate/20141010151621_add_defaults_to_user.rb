#Give the user default values
class AddDefaultsToUser < ActiveRecord::Migration
  def change
    change_column :users, :coin, :integer, default: 0
    change_column :users, :coinTo, :integer, default: 20
    change_column :users, :favorites, :integer, :array => true, default: [0, 0, 0, 0]
  end
end
