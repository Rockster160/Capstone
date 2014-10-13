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

  def show
    @game = Game.find(params[:id])
    # binding.pry

    @notification = current_user.notifications.find_or_create_by(
                            :notify_id => 0)
    @notification.update_attributes(
                            :message => "You visited a game!",
                            :game_id => @game.id,
                            :gold => @game.cost)
  end

  def play_count(game, increment)
    Game.find(game.id).update_attribute(:cost, game.cost += increment)
  end
  helper_method :play_count

  def update
  end

  def destroy
  end

  def mazegame
  end
end
