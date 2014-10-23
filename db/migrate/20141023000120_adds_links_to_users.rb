class AddsLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_url, :string, default: ""
    add_column :users, :twitter_url, :string, default: ""
    add_column :users, :website_url, :string, default: ""
  end
end
