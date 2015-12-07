require 'rails_helper'

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

  describe "DELETE #destroy" do
    it "deletes the expected goal" do
      user = create(:user)
      goal = create(:goal, user: user)

      sign_in(user)

      delete :destroy, format: :js, id: goal.id
      expect(Goal.count).to eq(0)

    end

    xit "does not delete goal belonging to another user"
    xit "deletes only the expected goal"
    xit "sets the successful flash message"
    xit "responds with http status 200 ok"
    xit "failing to destroy sets the error message"
    xit "responds with http status 404 not found for unkown goal"
  end
end
