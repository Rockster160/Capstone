#Forwards search function
class RegistrationsController < Devise::RegistrationsController

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

end
