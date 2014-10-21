class UserGameStatistic < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def increment_play_count
    self.increment!(:count, 1)
  end
end
