#Redirects information regarding the User to appropriate places.
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show

  def show
    @user = User.find(params[:id])
    unless user_signed_in?
      redirect_to root_path
    end
    @user.update_attribute(:coin, @user.coin+@user.coinTo)
    @user.update_attribute(:coinTo, 0)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(user_params[:id])
    @fav = @user.favorites
    @passFav = params[:passFav].to_i - 1
    @passId = params[:passId].to_i
    @fav[@passFav] = @passId
    # @user.favorites[params[:passFav].to_i - 1] = params[:passId].to_i
    # @user.update_attribute(:favorites, @fav)
    User.find(@user.id).update_attribute(:favorites, @fav)
    @user.save
    respond_to do |format|
      format.html { render partial: 'user_favorite_games', locals: { user: @user, url: :edit }}
      format.js
    end
  end

  def create
  @user = User.create( user_params )
  end

  def read
  end

  def destroy
    @user.avatar = nil
    @user.save
  end

  def index
  end

  def default
  end

  def badges 
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
