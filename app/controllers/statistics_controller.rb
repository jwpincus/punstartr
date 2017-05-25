class StatisticsController < ApplicationController

  def index
    @projects = Project.all.limit(20)
    @project = Project.find(2)
  end

  def donations_by_date
    result = {}
    ProjectBacker.all.map do |p|
      result[p.amount] = p.project_backers.count
    end
    render json: [{name: 'Count', data: result}]
  end


end
