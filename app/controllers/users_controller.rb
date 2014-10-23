#Redirects information regarding the User to appropriate places.
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show

  def show
    unless user_signed_in?
      redirect_to root_path
    end
    @user = User.find(params[:id])

    @unread = @user.notifications.where(isRead: false).reverse
    if @unread.length < 5
      @display = @user.notifications.where(isRead: true).reverse.first(5 - @unread.length)
    else
      @display = []
    end

    @trophies = []
    @trophies = Trophy.where(user_id: @user).reverse

    @history = []
    UserGameLog.where(user_id: @user).reverse.each do |history|
      @history << history.play_history_format
    end

    @user.update_attribute(:coin, @user.coin + @user.coinTo)
    @user.update_attribute(:coinTo, 0)

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
    if params[:readNotification]
      Notification.where(user_id: User.find(params[:id]).id).each do |notify|
        notify.update_attribute(:isRead, true)
      end
    end
  end

  def index
  end

  private
end
