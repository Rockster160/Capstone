class UserGameLog < ActiveRecord::Base
  include ::Formatter
  before_create :beforeCreate
  after_create :afterCreate
  belongs_to :user
  belongs_to :game

  def play_history_format
    @user = User.find(self.user_id).username
    @game = Game.find(self.game_id).name
    if self.event == "played"
      this_history = @user + " got a " + self.score.to_s + " in " + @game + " " + self.formatted_ago
    end
    return this_history
  end

  def beforeCreate
    checkTrophy =  Trophy.new(user_id: self.user_id,
                              game_id: self.game_id)
    checkTrophy.checker(score.to_s)
  end

  def afterCreate
    stat = UserGameStatistic.where(user_id: self.user_id, game_id: self.game_id).first
    stat ||= UserGameStatistic.create(user_id: self.user_id, game_id: self.game_id)
    stat.increment_play_count
  end
end
