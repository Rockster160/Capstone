class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def useralerts
    @user = User.find(params[:id])
  end

  def gamealerts
    @game = Game.find(params[:id])
  end
end
