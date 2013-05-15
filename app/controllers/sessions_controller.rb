class SessionsController < ApplicationController
	include SessionsHelper

	def new
		if signed_in?
			redirect_to '/'
		end
	end

	def create
		user = User.find_by_name(params[:session][:name].downcase)
		if user.nil? 
			user = User.find_by_name(params[:session][:name])
		end
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to '/'
		else
			if user.nil?
				flash.now[:error] = 'No user with that name' 
			else 
				flash.now[:error] = 'Password is incorrect' 
			end
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

end
