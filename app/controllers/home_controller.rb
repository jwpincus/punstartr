class HomeController < ApplicationController

  def index
    @categories = Category.all
    @projects = Project.all
    @most_funded = Project.most_funded
  end
end
