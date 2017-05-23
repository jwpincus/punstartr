class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def create
    @project = Project.find(params[:project_id])
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to project_path(@project)
    else
      redirect_to new_reward_path
    end
  end

  def new
    @reward = Reward.new

  end

  private

  def reward_params
    params.require(:reward).permit(:title, :description, :pledge_amount, :limit,)
    .merge(project_id: params[:project_id])
  end
end
