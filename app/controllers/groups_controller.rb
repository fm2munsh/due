class GroupsController < ApplicationController
	include SessionsHelper
	def index
		@groups = current_user.groups
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new params[:group]
		@group.save
		redirect_to @group
	end
	def join
		@user = current_user
		@group = Group.find(params[:id])
		if @group.users.include? @user
			flash[:error] = "Already in Group"
		else
			if @group.password == params[:password]
				@group.users << @user
			else
				flash[:error] = "Incorrect group password"
			end
		end
		redirect_to group_path @group
	end

  def show
    @group = Group.find(params[:id])
  end
end