class CreateUserGameStatistics < ActiveRecord::Migration
  def change
    create_table :user_game_statistics do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
