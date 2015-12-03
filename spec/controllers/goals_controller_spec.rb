require 'rails_helper'
include RandomData

RSpec.describe GoalsController, type: :controller do
  let(:my_user)   { create(:user) }

  describe "POST #create" do
    before do
      sign_in(my_user)
    end

    it "adds a new goal for the current user" do
      goals_size = Goal.where(user_id: my_user.id).length
      post :create, user_id: my_user.id, goal: { name: RandomData.random_goal }
      expect(Goal.where(user_id: my_user.id).length).to eq(goals_size + 1)
    end

    it "assigns the new goal to @goal" do
      post :create, user_id: my_user.id, goal: { name: RandomData.random_goal }
      expect(assigns(:goal)).to eq(Goal.last)
    end

    it "assigns the goal with the correct attributes" do
      post :create, user_id: my_user.id, goal: { name: "do the laundry" }
      my_goal = my_user.goals.first
      expect(my_goal.name).to eq("do the laundry")
    end

    it "redirects to user #show page" do
      post :create, user_id: my_user.id, goal: { name: RandomData.random_goal }
      expect(response).to redirect_to(user_path(my_user.id))
    end
  end
end
