class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def check_login
    if signed_in?
		@user = current_user
	else
		redirect_to new_user_path
  	end
  end

end
