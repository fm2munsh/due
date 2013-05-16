class PostsController < ApplicationController
	include SessionsHelper

	def create
		@post = Post.new(name: params[:name], group_id: params[:group_id])

		respond_to do |format|
			if @post.save
				format.js { render :template => "posts/create.js.erb", :content_type => 'text/javascript' }
			else
				format.js { render :nothing => true }
			end
		end
	end

	def update
		@post = Post.find params[:id]
		@post.update_attributes(params[:post])
		redirect_to @post.group
	end

	def delete
		@post = Post.find(params[:id])
		@post.delete
	end

	def edit
		@post = Post.find(params[:id])
		@post.save
	end
end