#Creat tables for Users
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :about
      t.integer :coin

      t.timestamps
    end
  end
end
