#Forwards search function
class RegistrationsController < Devise::RegistrationsController

  def read
    @users = User.search(params[:q]).result
  end
end
