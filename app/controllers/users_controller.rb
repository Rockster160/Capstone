#Redirects information regarding the User to appropriate places.
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show

  def show
    unless user_signed_in?
      redirect_to root_path
    end
    @user = User.find(params[:id])
    @unread = @user.notifications.where(isRead: false).reverse
    @history = []
    UserGameLog.where(user_id: @user).reverse.each do |history|
      @history << history.play_history_format
    end
    if @unread.length < 10
      @display = @user.notifications.where(isRead: true).reverse.first(10 - @unread.length)
    end
    @user.update_attribute(:coin, @user.coin+@user.coinTo)
    @user.update_attribute(:coinTo, 0)
    current_user.init
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:id])
    @fav = @user.favorites
    @passFav = params[:passFav].to_i - 1
    @passId = params[:passId].to_i
    @fav[@passFav] = @passId
    User.find(@user.id).update_attribute(:favorites, @fav)
    @user.save
    respond_to do |format|
      format.html { render partial: 'user_favorite_games', locals: { user: @user, url: :edit }}
      format.js
    end
  end

  def shout
    # @user = User.find(params[:id])
    # User.find(@user.id).shouts.create(:message => params[:message],
    #                                   :user_id => current_user)
  end

  def user_params
    params.require(:user).permit(:avatar)
  end

  def read
  end

  def destroy
    @user.avatar = nil
    @user.save
  end

  def index
  end

  private
end
