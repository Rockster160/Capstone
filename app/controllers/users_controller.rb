#Redirects information regarding the User to appropriate places.
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show
  before_filter :authenticate_user!, :except => :destroyshout

  def show
    unless user_signed_in?
      redirect_to home_path
    end
    #@user.username[0] = @user.username[0].capitalize

    @user = User.find(params[:id])

    if Time.now - @user.last_in > 1.day - 1.hour
      Notification.create(
                          user_id: @user.id,
                          message: "You got a daily sign in bonus of 50 coins! Thanks for visiting!",
                          title: "Daily sign in bonus!",
                          icon: 0
      )
      @user.update_attribute(:coinTo, 50)
    end

    @user.update_attribute(:last_in, Time.now)

    @rng_game = Game.find(rand(Game.all.length) + 1).id

    @unread = @user.notifications.where(isRead: false).reverse
    if @unread.length < 5
      @display = @user.notifications.where(isRead: true).reverse.first(5 - @unread.length)
    else
      @display = []
    end

    @trophies = []
    @trophies = Trophy.where(user_id: @user).reverse

    @history = UserGameLog.where(user_id: @user).reverse



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

  def shout
    if params[:controller] == "users"
      @receiver = User.find(params[:id])
    else
      @receiver = Game.find(params[:id])
    end
      # binding.pry
    if params[:shout] && params[:shout][:message].length > 1
      @shout = @receiver.shouts.create(:message => params[:shout][:message],
                                      :sent_from_id => current_user.id
      )
      if params[:controller] == "users"
        Notification.create(
                            user_id: @receiver.id,
                            message: @receiver.username + " has left you a shout!",
                            title: "You have a new shout!",
                            icon: 1
        )
      end
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def follow
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to user_path(user)
  end

  def unfollow
    user = User.find(params[:id])
    current_user.stop_following(user)
    redirect_to user_path(user)
  end

  def shoutmessage
  end

  def destroyshout
    Shout.find(params[:shout_id]).destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
end
