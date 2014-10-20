class Game < ActiveRecord::Base
    has_many :scores
    has_many :shouts
    has_many :user_game_statistics
end
