class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:username]

  validates :username, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:email)
  #     where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
  #   else
  #     where(conditions).first
  #   end
  # end


end
