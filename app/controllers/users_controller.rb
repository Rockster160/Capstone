#Redirects information regarding the User to appropriate places.
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show
  before_filter :authenticate_user!, :except => :destroyshout

  def show
    @user = User.find(params[:id])
    current_user.update_attribute(:last_sign_in_at, Time.now)

    if Time.now - @user.last_in > 1.day - 1.hour
      Notification.create(
                          user_id: @user.id,
                          message: "You got a daily sign in bonus of 50 coins! Thanks for visiting!",
                          title: "Daily sign in bonus!",
                          icon: 0
      )
      @user.update_attribute(:coinTo, 50)
      @user.update_attribute(:last_in, Time.now)
    end


    @rng_game = Game.find(rand(Game.all.length) + 1).id

    @trophies = Trophy.where(user_id: @user).reverse
    @history = UserGameLog.where(user_id: @user).order(:created_at).reverse
    @unread = @user.notifications.where(isRead: false).reverse
    if @unread.length < 5
      @display = @user.notifications.where(isRead: true).reverse.first(5 - @unread.length)
    else
      @display = []
    end
    @follow_history = []
    @user.following_users.each do |check_up_user|
      UserGameLog.where(user_id: check_up_user.id).each do |get_history|
        @follow_history << get_history
      end
    end
    @follow_history = @follow_history.sort_by{|e| e[:created_at]}.reverse

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

  def changeAva
    current_user.newAva(params[:id])
    respond_to do |format|
      format.html
      format.js {render inline: "location.reload();" }
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
    @receiver = User.find(params[:id])
    if params[:shout] && params[:shout][:message].length > 1
      @shout = @receiver.shouts.create(:message => params[:shout][:message],
                                      :sent_from_id => current_user.id
      )
      Notification.create(
                          user_id: @receiver.id,
                          sent_id: current_user.id,
                          message: current_user.username + " has left you a shout!",
                          title: "You have a new shout!",
                          icon: 1
      )
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def destroy
    Notification.where(user_id: current_user.id).each do |x|
      x.destroy
    end
    Trophy.where(user_id: current_user.id).each do |x|
      x.destroy
    end
    UserGameLog.where(user_id: current_user.id).each do |x|
      x.destroy
    end
    UserGameStatistic.where(user_id: current_user.id).each do |x|
      x.destroy
    end
    Shout.where(user_id: current_user.id).each do |x|
      x.destroy
    end
  end

  def destroyshout
    Shout.find(params[:shout_id]).destroy
    respond_to do |format|
      format.html
      format.js
    end
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
end
