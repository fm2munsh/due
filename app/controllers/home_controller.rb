class HomeController < ApplicationController
  def index
    @group = Group.all
  end
end
