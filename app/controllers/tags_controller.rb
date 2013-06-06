class TagsController < ApplicationController
  include SessionsHelper

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    @tag.post_id = params[:id]
    puts "Create TAG"
    puts @tag.attributes
	respond_to do |format|
		if @tag.save
			format.js { render :template => "tags/create", :content_type => 'text/javascript' }
		else
			puts "Tag did not save"
			@tag.errors.each do |k,e|
				puts k
				puts e
			end
			format.js { render :template => "tags/error", :content_type => 'text/javascript' }
		end
		format.html { redirect_to :back }
	end
  end
  def destroy
  	@tag = Tag.find(params[:id])
  	@tag.destroy
  	respond_to do |format|
		if @tag.save
			format.js { render :template => "tags/delete_success", :content_type => 'text/javascript' }
		else
			puts "Tag did not save"
			@tag.errors.each do |k,e|
				puts k
				puts e
			end
			format.js { render :template => "tags/error", :content_type => 'text/javascript' }
		end
		format.html { redirect_to :back }
	end
  end
end
