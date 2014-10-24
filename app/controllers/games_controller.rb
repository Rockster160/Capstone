#Game Controller, redirects any information from games and sends notifications.
class GamesController < ApplicationController
  def read
    @games = []
    Game.all.each do |game|
      game.cost = 0 if !(game.cost > 0)
      @games << game.name
    end
  end
  # Used via AJAX
  def info
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end
  # No more AJAX. :D
  def show
    @game = Game.find(params[:id])
    if user_signed_in?
      @check = Notification.where(notify_id: 0, user_id: current_user.id)
      if @check.length == 0 #^^ If Notification is unique
        Notification.create(
                            :title => "First visit!",
                            :message => "You visited your first game!",
                            :game_id => @game.id,
                            :user_id => current_user.id,
                            :icon => 0,
                            :notify_id => 0
                            )
        User.find(current_user).update_attribute(:coinTo, 50)
      end
    end
  end

  def play
    if user_signed_in?
      @user = User.find(current_user.id)
      @game = Game.find(params[:id])
      @uId = @user.id
      @gId = @game.id
      if params[:passScore]
        @score = params[:passScore]
        gold = @game.mapScoreToCoin(@score)
        Notification.create(
                            game_id: @gId,
                            user_id: @uId,
                            message: "You played " +
                                      @game.name +
                                      " and won " +
                                      gold.to_s +
                                      " coins!!",
                            title: "You won some coins!",
                            icon: 3
        )
        User.find(@user.id).update_attribute(:coinTo, gold + @user.coinTo)

        checkTrophy =  Trophy.new(user_id: @uId,
                                  game_id: @gId)
        checkTrophy.checker(@score)

        UserGameLog.create(user_id: @uId, game_id: @gId, score: @score)

        stat = UserGameStatistic.where(user_id: @uId, game_id: @gId).first
        stat ||= UserGameStatistic.create(user_id: @uId, game_id: @gId)
        stat.increment_play_count
      end
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  def mazegame
  end
end
