class UsersController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show]
  before_filter :authenticate_user!

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

  def show
    @user = User.find(params[:id])
    @q = User.search(params[:q])
    @users = @q.result
  end
end
