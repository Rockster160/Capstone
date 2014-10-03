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
    @user = User.find_by_username(params[:id])
  end
end
