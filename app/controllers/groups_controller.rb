class GroupsController < ApplicationController
	def index
	end
	def new
		@group = Group.new
	end
	def create
	@group = Group.new params[:group]
	end
end