class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:username]

  validates :username, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "200x300>", :thumb => "100x100>" }, :default_url => "samurai.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimages\/.*\Z/

  has_many :games
  has_many :rules

  def award(achievement)
    rules << rule.new
  end

  def awarded(achievement)
    games.count(:conditons => { :type => achievement }) > 0
  end

  
end
