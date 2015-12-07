class GoalsController < ApplicationController
  def create
    @user = current_user
    @goal = @user.goals.build(goal_params)

    if @goal.save
      flash[:notice] = "Goal saved"
      redirect_to user_path(@user.id)
    else
      flash[:error] = "There was an error saving your goal"
      redirect_to user_path(@user.id)
    end
  end

  def destroy
    @goal = Goal.find(params[:id])

    if @goal.destroy
      flash[:notice] = "Goal completed successfully!"
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
