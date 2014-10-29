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

  def conversation
    @theirside = User.find(params[:id]).shouts.where(sent_from_id: current_user.id)
    @myside = current_user.shouts.where(sent_from_id: params[:id])
    @conv = (@myside + @theirside).sort_by{|e| e[:created_at]}.reverse
  end
end
