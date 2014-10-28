class IndexController < ApplicationController
  def home
    @user = User.find(0)
    @index = []
    UserGameStatistic.group('game_id').sum(:count).sort {|a,b| a[1] <=> b[1]}.reverse.first(4).each do |findGame|
      @index << Game.find(findGame[0])
    end
    @trophies = Trophy.all
    @history = UserGameLog.all
    @online = []
    @offline = []
    User.all.order(:updated_at).reverse.each do |user|
      unless user.id == 0
        if user.online?
          @online << user
        else
          @offline << user
        end
      end
    end
  end

  def partialswitch
    respond_to do |format|
      format.html
      format.js
    end
  end
end
