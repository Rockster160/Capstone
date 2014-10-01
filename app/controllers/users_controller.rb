class ProfileController < Devise::DeviseController
  def create
  end

  def read
    @users = @q.result
    @q = User.search(params[:q])
  end

  def update
  end

  def destroy
  end

  def index
  end
end
