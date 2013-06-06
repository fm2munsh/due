module SessionsHelper
	def sign_in(user)
    	session[:user_id] = user.id
  	end

  	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	
  	def signed_in?
      if !session[:user_id].nil? 
        puts "Cookie exists"
        return User.exists?(session[:user_id])
      else
        puts "No cookie"
        return false
      end
  	end
end
