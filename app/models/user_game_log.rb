class UserGameLog < ActiveRecord::Base
  include ::Formatter
  belongs_to :user
  belongs_to :game
end
