class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show

  def show
    @user = User.find(params[:id])
    unless user_signed_in?
      redirect_to root_path
    end
    @data = 0 if !(@data)
    if params[:passId]
      @data = params[:passId]
    end
    respond_to do |format|
      format.html
      format.js
    end
    if @user.coinTo > 0
      @user.popup << 0
    end
  end

  def getscores
  end

  def update
    @user = User.find(params[:id])
    unless current_user.id.to_s == params[:id]
      redirect_to :controller => 'users', :action => 'update', :id => current_user.id
    end
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

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.


end
