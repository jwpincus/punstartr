class PaymentsController < ApplicationController

  def new

    @reward = Reward.find(params[:reward_id])
  end

  def create
    @reward = Reward.find(params[:reward_id])
    proj = current_user.project_backers.create!(
                                        reward: @reward,
                                        project: @reward.project,
                                        pledge_amount: @reward.pledge_amount
                                        )
    binding.pry
  end

end
