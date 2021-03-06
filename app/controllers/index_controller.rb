class IndexController < ApplicationController
  def home
    current_user.update_attribute(:last_sign_in_at, Time.now) if user_signed_in?
    @user = User.find(0)
    @index = []
    UserGameStatistic.group('game_id').sum(:count).sort {|a,b| a[1] <=> b[1]}.reverse.first(4).each do |findGame|
      @index << Game.find(findGame[0])
    end
    @trophies = Trophy.all.order(:created_at).reverse
    @history = UserGameLog.all.order(:created_at).reverse
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
