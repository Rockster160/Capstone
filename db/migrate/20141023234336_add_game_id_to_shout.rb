class AddGameIdToShout < ActiveRecord::Migration
  def change
    add_column :shouts, :game_id, :integer
  end
end
