class Trophy < ActiveRecord::Base
  include ::Formatter
  belongs_to :user

  def checker(score)
    @game = self.game_id
    @user = self.user_id
    @theGame = Game.find(@game)
    @theUser = User.find(@user)
    everyPlay(score)
    allTime(score)
    perfectScore(score)
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
      Trophy.where(uniq_id: 2, game_id: @game).all.each do |beatenUser|
        Notification.create(
                            game_id: @game,
                            user_id: beatenUser.user_id,
                            message: "Your score has been beaten in " +
                                      @theGame.name +
                                      " by " + User.find(@user).username +
                                      "with a " + score + ".",
                            title: "High score beaten!",
                            icon: 4
        )
        beatenUser.destroy
      end
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

  def everyPlay(score)
    if Trophy.where(user_id: @user, uniq_id: 3).length == 0
      games = Game.all.length
      playedall = 0
      games.times do |checkHistory|
        has_played = UserGameLog.where(user_id: @user, game_id: (checkHistory + 1))
        playedall += 1 if has_played.length > 0
      end
      if playedall >= games
        Notification.create(
                            game_id: @game,
                            user_id: @user,
                            message: "You've played every game hosted on GameHub!" +
                                    "Additionally, you win 500 coins!",
                            title: "Every Game Played!",
                            icon: 2
        )
        @theUser.update_attribute(:coinTo, 500 + @theUser.coinTo)
        self.update_attribute(:uniq_id, 3)
        self.save!
      end
    end
  end
end
