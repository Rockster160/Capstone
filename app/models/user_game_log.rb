class UserGameLog < ActiveRecord::Base
  include ::Formatter
  belongs_to :user
  belongs_to :game

  def play_history_format
    @user = User.find(self.user_id).username
    @game = Game.find(self.game_id).name
    if self.event == "played"
      this_history = @user + " got a " + self.score.to_s + " playing " + @game + " " + self.formatted_ago
    end
    return this_history
  end
end
