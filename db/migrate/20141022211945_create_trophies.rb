class CreateTrophies < ActiveRecord::Migration
  def change
    create_table :trophies do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :uniq_id
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
