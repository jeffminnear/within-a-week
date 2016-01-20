class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @goals = @team.goals
  end

  def create
    @team = Team.create
  end

  def destroy
    @team = Team.find(params[:id])
  end
end
