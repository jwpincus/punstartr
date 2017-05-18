class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def create
    @reward = Reward.new(reward_params)
    
    @reward.save
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:title, :description, :pledge_amount, :limit)
  end
end
