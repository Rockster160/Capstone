class UserGameStatistic < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def increment_play_count(user, game)
    
  end
end
