class HomeController < ApplicationController

  def index
    @categories = Category.all
    @projects = Project.all
    @top_project = Project.most_funded
  end
end
