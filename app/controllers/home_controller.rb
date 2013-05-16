class HomeController < ApplicationController
	include SessionsHelper
	def index
		@group = Group.all
	end
end
