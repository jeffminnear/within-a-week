class GoalsController < ApplicationController

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      flash[:notice] = "Goal saved"
      flash[:event] = "User Added Goal"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "There was an error saving your goal"
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])

    if @goal.destroy
      flash[:notice] = "Goal completed successfully!"
      flash[:event] = "User Completed Goal"
    else
      flash[:error] = "There was an error marking your goal completed."
    end

    respond_to do |format|
      format.js
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:name)
  end
end
