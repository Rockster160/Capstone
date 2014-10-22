#Forwards search function
class RegistrationsController < Devise::RegistrationsController
  include ::Formatter

	def create
	  @user = User.create( user_params )
	end

	private
	def user_params
	  params.require(:user).permit(:avatar)
	end


  # def read
		# @users = User.search(params[:q]).result
  # end

  def read
    @users = User.search(params[:q]).result
  end

  private

  def account_update_params
    params.require(:user).permit(:about, :email, :password, :password_confirmation, :current_password)
  end
end
