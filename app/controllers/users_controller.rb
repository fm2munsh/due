class UsersController < ApplicationController
	
	include SessionsHelper
	before_filter :check_login, :only => ['edit', 'update']
	
  def new
  	@user = User.new
  end

  def create 
  	confirmation = params[:password_confirmation]
  	password = params[:user][:password]
  	puts '------------------------------'
  	puts password
  	puts confirmation
  	if confirmation == password
		@user = User.new(params[:user])
	    if @user.save
	        sign_in @user
	       	redirect_to root_path
	    else
	    	render 'new'
	    end
	else 
		flash[:error] = "Confirmation does not match password"
		redirect_to new_user_path
	end
  end

  def edit 
  	@user = current_user
  end
  def update

  end

end
