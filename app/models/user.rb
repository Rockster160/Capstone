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

  has_many :points  
  has_many :badges , :through => :levels 
  has_many :levels  

  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "defaultpic.jpg"
  validates_attachment :avatar, :styles => { 
                                   :medium => "300x300", 
                                   :thumb => "100x100" 
                               }, :content_type => { 
                                   :content_type => "image/jpg",
                                   :content_type => "image/jpeg", 
                                   :content_type => "image/png"
                               },
                               :size => { :in => 0..3.megabytes }

  validates :username, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }


  include PgSearch
  multisearchable :against => [:username]

  before_save :ensure_is_valid
  has_many :notifications
  include PublicActivity::Model

  def change_points(options)
    if Gioco::Core::KINDS
      points = options[:points]
      kind   = Kind.find(options[:kind])
    else
      points = options
      kind   = false
    end

    if Gioco::Core::KINDS
      raise "Missing Kind Identifier argument" if !kind
      old_pontuation = self.points.where(:kind_id => kind.id).sum(:value)
    else
      old_pontuation = self.points.to_i
    end
    new_pontuation = old_pontuation + points
    Gioco::Core.sync_resource_by_points(self, new_pontuation, kind)
  end


  def next_badge?(kind_id = false)
    if Gioco::Core::KINDS
      raise "Missing Kind Identifier argument" if !kind_id
      old_pontuation = self.points.where(:kind_id => kind_id).sum(:value)
    else
      old_pontuation = self.points.to_i
    end
    next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first
    last_badge_point = self.badges.last.try('points')
    last_badge_point ||= 0

    if next_badge
      percentage      = (old_pontuation - last_badge_point)*100/(next_badge.points - last_badge_point)
      points          = next_badge.points - old_pontuation
      next_badge_info = {
                          :badge      => next_badge,
                          :points     => points,
                          :percentage => percentage
                        }
    end
  end


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
      binding.pry
    end
  end

  def init
  end
  
end
