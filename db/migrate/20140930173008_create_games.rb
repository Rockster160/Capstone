#Create tables for games as follows:
class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :ava
      t.string :play
      t.text :about
      t.text :howto
      t.integer :cost

      t.timestamps
    end
  end
end
