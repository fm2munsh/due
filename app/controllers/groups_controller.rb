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
		if @group.password == params[:password]
			@group.users << @user
			@user.groups << @group
		end
		redirect_to group_path @group
	end

  def show
    @group = Group.find(params[:id])
  end
end