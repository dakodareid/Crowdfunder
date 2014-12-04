class RewardsController < ApplicationController
  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @reward = @project.rewards.build(reward_params)
    if @reward.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def destroy
      @reward = Reward.find(params[:id])
      @reward.destroy
  end

  private
  def reward_params
    params.require(:rewards).permit(:amount, :description, :project_id)
  end
end
