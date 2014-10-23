#Forwards search function
class RegistrationsController < Devise::RegistrationsController

  def read
    @users = User.search(params[:q]).result
  end

  private

  def account_update_params
    params.require(:user).permit(:about, :facebook_url, :twitter_url, :website_url, :email, :password, :password_confirmation, :current_password)
  end
end
