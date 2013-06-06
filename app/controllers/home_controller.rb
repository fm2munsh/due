class HomeController < ApplicationController
	include SessionsHelper
	def index
		@groups = Group.all
		@posts = [] 
		# if signed_in?
		# 	current_user.groups.each do |group|
		# 		group.posts.each {|p| @posts << p}
		# 	end
		# end
		# @posts.sort! { |a,b| b.id <=> a.id }
		# # sort it by date instead
	end
end
