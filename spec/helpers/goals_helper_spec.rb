require 'rails_helper'

RSpec.describe GoalsHelper, type: :helper do
  describe "time_left_to_complete(goal)" do
    before do
      # Freeze time as task is time-sensitive
      travel_to Time.now
    end

    after { travel_back }

    it "returns 7 days for a just created goal" do
      goal = create(:goal)
      expect(helper.time_left_to_complete(goal)).to eq "7 days"
    end

    it "returns number of hours left on last day" do
      goal = create(:goal)
      travel 6.days + 1.hour
      expect(helper.time_left_to_complete(goal)).to eq("about 23 hours")
    end
  end
end
