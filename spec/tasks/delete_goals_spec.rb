require 'rails_helper'
require 'rake'
WithinAWeek::Application.load_tasks

RSpec.describe "delete_goals task", type: :task do
  before do
    travel_to Time.now
  end

  after { travel_back }

  it "deletes goals that have expired" do
    goal = create(:goal)

    travel (Goal::TIME_ALLOTTED_TO_COMPLETE_A_GOAL_IN_DAYS.days + 1.day)

    expect { invoke_delete_goals }.to change { Goal.count }.from(1).to(0)
  end

  it "does not delete goals that are still active" do
    goal = create(:goal)

    travel (Goal::TIME_ALLOTTED_TO_COMPLETE_A_GOAL_IN_DAYS.days - 1.day)

    expect { invoke_delete_goals }.not_to change { Goal.count }
  end

  def invoke_delete_goals
    task = Rake::Task["todo:delete_goals"]
    task.reenable
    task.invoke
  end
end
