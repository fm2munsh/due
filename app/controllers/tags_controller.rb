class TagsController < ApplicationController
  include SessionsHelper

  def new
    @tag = Tag.new
  end

  def create
    @post = Post.find(params[:id])
    @post.tags.build(:name => params[:tag])
    @post.save!
  end
end
