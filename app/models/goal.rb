class Goal < ActiveRecord::Base

  TIME_ALLOTTED_TO_COMPLETE_A_GOAL_IN_DAYS  = 7

  belongs_to :user

  def self.active
    where("created_at > ?", TIME_ALLOTTED_TO_COMPLETE_A_GOAL_IN_DAYS.days.ago)
  end
end
