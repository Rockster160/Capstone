class Trophy < ActiveRecord::Base
  include ::Formatter
  belongs_to :user

  def checker(score)
    @game = self.game_id
    @user = self.user_id
    @theGame = Game.find(@game)
    @theUser = User.find(@user)
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
                                    ". You\'ve won an additional 500 coins!",
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
    top_score_list = []
    if score.to_i > highscore
      Notification.create(
                          game_id: @game,
                          user_id: @user,
                          message: "You got the new high score in " +
                                    @theGame.name +
                                    " of " + score +
                                    ". You win an additional 100 coins!",
                          title: "High score!",
                          icon: 2
      )
      Trophy.where(uniq_id: 2, game_id: @game).all.each do |beatenUser|
        Notification.create(
                            game_id: @game,
                            user_id: beatenUser.user_id,
                            message: "Your score has been beaten in " +
                                      @theGame.name +
                                      " by " + User.find(@user).username,
                            title: "High score beaten!",
                            icon: 4
        )
        beatenUser.destroy
      end
      self.update_attribute(:uniq_id, 2)
      self.save!
      @theUser.update_attribute(:coinTo, 100 + @theUser.coinTo)
    end
  end

  def everyPlay
  end
end
