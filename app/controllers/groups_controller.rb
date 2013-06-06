class GroupsController < ApplicationController
	include SessionsHelper
	def index
		# @groups = current_user.groups
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new params[:group]
		puts params[:group]
		@group.save
		@group.users << current_user
		respond_to do |format|
			if @group.save
				format.js { render :template => "groups/create", :content_type => 'text/javascript' }
			else
				puts "Group did not save"
				@group.errors.each do |k,e|
					puts k
					puts e
				end
				format.js { render :template => "groups/error", :content_type => 'text/javascript' }
			end
			format.html { redirect_to groups_path }
		end
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
  def show_by_name
    @group = Group.find(:first, conditions: ["lower(name) = ?", params[:name].downcase])
    if @group
	    render 'show'
	else
		flash[:error] = "Group not found"
		redirect_to groups_path
	end
  end
end