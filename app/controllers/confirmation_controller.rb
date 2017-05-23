class ConfirmationController < ApplicationController

  def show
    @reward = current_user.rewards.find(params[:reward_id])
  end

end
