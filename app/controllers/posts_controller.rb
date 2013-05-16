class PostsController < ApplicationController
	include SessionsHelper
	def new
		# Should be deprecated eventually
		@post = Post.new
	end

	def create
		@post = Post.new params[:post]
		@post.each params[:tags] do |t|
			@task = Task.new(name: t, post_id: @post.id)
			@task.save
		end
		@post.save
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

	def ajaxnew
		@post = Post.new(name: params[:name], group_id: params[:group_id])
		@post.save
		render @post
	end
end