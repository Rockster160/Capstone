#Handles Devise methods and authentications
class User < ActiveRecord::Base
  before_save :ensure_is_valid
  has_many :notifications
  include PublicActivity::Model

  validates :username, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "defaultpic.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimages\/.*\Z/

  def favorite_games
    favs = self.favorites
    favs.each_with_index do |change, pos|
      if favs[pos] != 0
        favs[pos] = Game.find(change)
      end
    end
    return favs
  end

  private
def ensure_is_valid
  # binding.pry
  if self.valid?
    # binding.pry
  else
    # binding.pry
  end
end
end
