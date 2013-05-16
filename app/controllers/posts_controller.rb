class PostsController < ApplicationController
	def new
		# Should be deprecated eventually
		@post = Post.new
	end
	def create
		@post = Post.new params[:post]
		@post.each params[:tags] do |t|
			Task.new(name: t, post_id: @post.id)		
		end
	end
	def delete
		@post = Post.find(params[:id])
		@post.delete
	end
end
