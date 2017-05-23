class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def create
byebug
    @project =  
@reward = Reward.new(reward_params)

    
    @reward.save

    redirect_to project_path(@project)
  end

  def new
    @reward = Reward.new
  end

  private

  def reward_params
    params.require(:reward).permit(:title, :description, :pledge_amount, :limit)
  end
end
