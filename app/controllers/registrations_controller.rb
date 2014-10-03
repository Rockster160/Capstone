class User::RegistrationsController < Devise::RegistrationsController

  def read
    @q = User.search(params[:q])
    @users = @q.result
  end

end
