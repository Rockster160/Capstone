class AddThumbToGame < ActiveRecord::Migration
  def change
    add_column :games, :thumb, :string
  end
end
