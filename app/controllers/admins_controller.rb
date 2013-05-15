class AdminsController < ApplicationController
	def new
		# Should be deprecated eventually
		@admin = Admin.new
	end
	def create 
		@admin = Admin.new params[:admin]
	end
	
end
