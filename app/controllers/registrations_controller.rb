#Forwards search function
class RegistrationsController < Devise::RegistrationsController

  def read
    @users = User.search(params[:q]).result
  end

  def edit
    @rng_game = Game.find(rand(Game.all.length) + 1).id

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
  end

  private

  def account_update_params
    params.require(:user).permit(:about, :facebook_url, :twitter_url, :website_url, :email, :password, :password_confirmation, :current_password)
  end
end
