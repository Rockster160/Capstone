class CreateUserGameLogs < ActiveRecord::Migration
  def change
    create_table :user_game_logs do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :score
      t.string :event, default: "played"

      t.timestamps
    end
  end
end
