class PledgesController < ApplicationController
	def new
		@pledge = Pledge.new
	end

	def create
    	@pledge = Pledge.new(pledge_params)
    	@pledge.user_id = current_user.id

	    if @pledge.save
	      redirect_to user_path(current_user)
	    else
	      render :new
	    end
	end

	def edit

	end

	def destroy
		@pledge = Pledge.find(params[:id])
    	@pledge.destroy
	end

	private
    def pledge_params
      params.require(:pledge).permit(:amount, :reward_id, :project_id)
    end
end
