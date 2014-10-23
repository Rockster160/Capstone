class AddAvaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ava, :string
  end
end
