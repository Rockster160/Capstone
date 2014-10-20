class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :message

      t.timestamps
    end
  end
end
