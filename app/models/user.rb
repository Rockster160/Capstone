#Handles Devise methods and authentications
class User < ActiveRecord::Base
  has_many :notifications
  has_many :shouts
  has_many :user_game_statistics
  has_many :user_game_logs
  include PublicActivity::Model

  validates :username, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "defaultpic.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg","image/png"]

  def favorite_games
    favs = self.favorites
    favs.each_with_index do |change, pos|
      if favs[pos] != 0
        favs[pos] = Game.find(change)
      end
    end
    return favs
  end

  def init
  end
end
