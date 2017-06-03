class HomeController < ApplicationController

  def index
    @categories = Category.all
    @projects = Project.paginate(page: params[:page], :per_page => 12)
    @most_funded = Project.most_funded
  end
end
