class PaymentsController < ApplicationController

  def new

    @reward = Reward.find(params[:reward_id])
  end

  def create
    @reward = Reward.find(params[:reward_id])
    transaction = current_user.project_backers.new(
                                        reward: @reward,
                                        project: @reward.project,
                                        pledge_amount: @reward.pledge_amount
                                        )
    if transaction.save
      redirect_to confirmation_path(reward_id: @reward.id)
    else
      flash[:error] = "unsuccessful transaction. :( "
    end
  end

end
