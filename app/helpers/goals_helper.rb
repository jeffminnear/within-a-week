module GoalsHelper
  DANGER_THRESHOLD_IN_DAYS                  = 6
  WARNING_THRESHOLD_IN_DAYS                 = 4

  def time_left_to_complete(goal)
    time_of_expiration = goal.created_at + Goal::TIME_ALLOTTED_TO_COMPLETE_A_GOAL_IN_DAYS.days
    time_left_until_expiration = distance_of_time_in_words(Time.now, time_of_expiration)
  end

  def urgency(goal)
    time_elapsed_in_days = (Time.now - goal.created_at) / 1.day
    if time_elapsed_in_days > DANGER_THRESHOLD_IN_DAYS
      return "danger"
    elsif time_elapsed_in_days > WARNING_THRESHOLD_IN_DAYS
      return "warning"
    else
      return "ok"
    end
  end
end
