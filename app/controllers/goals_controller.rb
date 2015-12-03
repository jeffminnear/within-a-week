class GoalsController < ApplicationController
  def create
    @user = current_user
    @goal = @user.goals.build(goal_params)

    if @goal.save!
      flash[:notice] = "Goal saved"
    else
      flash[:error] = "There was an error saving your goal"
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:name)
  end
end
