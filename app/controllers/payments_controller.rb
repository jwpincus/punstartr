class PaymentsController < ApplicationController

  def new

    @reward = Reward.find(params[:reward_id])
  end

  def create
    @reward = Reward.find(params[:reward_id])
    current_user.backed_projects.create(
                                        reward: @reward,
                                        project: @reward.project,
                                        pledge_amount: @reward.pledge_amount
                                        )
  end

end
