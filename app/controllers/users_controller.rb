class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show

  def show
    @user = User.find(params[:id])
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
    @user = User.create( user_params )
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar)
  end

  def read
  end

  def update
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

end
