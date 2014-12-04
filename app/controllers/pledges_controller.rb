class PledgesController < ApplicationController
	def new
		@pledge = Pledge.new
	end

	def create
		@user = User.find(params[:user_id])
    	@pledge = @user.pledge.build(pledge_params)
	    if @pledge.save
	      redirect_to user_path(@user)
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
    params.require(:pledge).permit(:amount, :project_id)
  end
end
