#Game Controller, redirects any information from games and sends notifications.
class GamesController < ApplicationController
  def create
  end

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
      @notification = current_user.notifications.find_or_create_by(
                              :notify_id => 0) #Only if notification is unique
      @notification.update_attributes(
                              :title => "First visit!",
                              :message => "You visited your first game!",
                              :game_id => @game.id,
                              :icon => 0,
                              :gold => 50)
    end
  end

  def play
    @game = Game.find(params[:id])
    @user = User.find(current_user.id)
    user_game_statistics.where(@user, @game).increment_play_count

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
  end

  def destroy
  end

  def mazegame
  end
end
