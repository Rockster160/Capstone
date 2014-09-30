class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :about
      t.text :howto
      t.integer :cost

      t.timestamps
    end
  end
end
