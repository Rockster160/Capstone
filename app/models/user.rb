#Handles Devise methods and authentications
class User < ActiveRecord::Base
  include ::Formatter
  after_create :randomAvatar
  has_many :notifications
  has_many :shouts
  has_many :trophies
  has_many :user_game_statistics
  has_many :user_game_logs
  acts_as_followable
  acts_as_follower

  validates :username, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def favorite_games
    favs = self.favorites
    favs.each_with_index do |change, pos|
      if favs[pos] != 0
        favs[pos] = Game.find(change)
      end
    end
    return favs
  end

  def randomAvatar
    self.last_in = Time.now
    self.username[0] = self.username[0].capitalize
    rng = case rand(6)
    when 0
      "One"
    when 1
      "Two"
    when 2
      "Three"
    when 3
      "Four"
    when 4
      "Five"
    when 5
      "Six"
    when 6
      "Seven"
    when 7
      "Eight"
    end
    self.update_attribute(:ava, "defAva" + rng + ".jpg")
  end

  def online?
    updated_at > 20.minutes.ago
  end
end
