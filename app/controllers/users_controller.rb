class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :show

  def show
    @user = User.find(params[:id])
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
  end

  def read
  end

  def update
  end

  def destroy
  end

  def index
  end

end
