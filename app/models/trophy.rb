class Trophy < ActiveRecord::Base
  include ::Formatter
  belongs_to :user

  def checker(score)
    @game = self.game_id
    @user = self.user_id
    @theGame = Game.find(game)
    @theUser = User.find(user)
    perfectScore(score)
    allTime(score)
    everyPlay
  end

  def perfectScore(score)
    if score.to_i == @theGame.detailscore.last
      self.update_attribute(:uniq_id, 1)
      self.save!
      Notification.create(
                          game_id: @game,
                          user_id: @user,
                          message: "You got a perfect score in " +
                                    @theGame.name +
                                    ". You win an additional 500 coins!",
                          title: "Perfect score!",
                          icon: 2
      )
      @theUser.update_attribute(:coinTo, 500 + @theUser.coinTo)
    end
  end

  def allTime(score)
    perfectScore = @theGame.detailscore.last
    history = UserGameLog.where(game_id: @game).order(:score)
    highscore = perfectScore == 0 ? history.first.score : history.reverse.first.score
    if score.to_i >= highscore
      self.update_attribute(:uniq_id, 2)
      self.save!
      Notification.create(
                          game_id: @game,
                          user_id: @user,
                          message: "You got the new high score in " +
                                    @theGame.name +
                                    ". You win an additional 100 coins!",
                          title: "High score!",
                          icon: 2
      )
      @theUser.update_attribute(:coinTo, 100 + @theUser.coinTo)
    end
  end

  def everyPlay
  end
end
