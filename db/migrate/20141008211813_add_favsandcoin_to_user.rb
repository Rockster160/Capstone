# Add favorits and coinTo value columns to User
class AddFavsandcoinToUser < ActiveRecord::Migration
  def change
    add_column :users, :coinTo, :integer
    add_column :users, :favorites, :integer, :array => true, :length => 5
  end
end
