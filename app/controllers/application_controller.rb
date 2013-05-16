class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_login, except: :check_login

  def check_login
    if signed_in?
		@user = current_user
	else
		redirect_to new_user_path
  	end
  end

end
