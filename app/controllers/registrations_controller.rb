class User::RegistrationsController < Devise::RegistrationsController

  def read
    @users = @q.result
    @q = User.search(params[:q])
  end

end
