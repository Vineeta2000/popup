class SessionsController < Devise::SessionsController
  def create
	#debugger
	user = User.find_by_user_name(params[:user][:user_name])
   	if user
    	if user.valid_password?(params[:user][:password])
        flash[:notice] = "---------Log-in Sucessfully----------"
        sign_in(user)
        redirect_to root_path
      else
    flash[:alert]= "--------Incorrect password-----------"
    redirect_to  user_session_path
      end
       else
        flash[:alert]="---------User not found--------------"
        redirect_to  user_session_path
   end
end
end
