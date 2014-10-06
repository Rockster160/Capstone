class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end

    # @q = User.search(params[:q])
    # @users = @q.result
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
