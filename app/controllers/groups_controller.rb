class GroupsController < ApplicationController
	include SessionsHelper
	def index
	end
	def new
		@group = Group.new
	end
	def create
		@group = Group.new params[:group]
	end
	def join
		@user = current_user
		@group = Group.find(params[:id])
		if @group.password == params[:password]
			@group.users << @user
			@user.groups << @group
		end
		redirect_to group_path @group
	end
end