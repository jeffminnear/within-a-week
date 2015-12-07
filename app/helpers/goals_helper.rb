module GoalsHelper
  def time_left_to_complete(goal)
    time_of_expiration = goal.created_at + 7.days
    time_left_until_expiration = distance_of_time_in_words(Time.now, time_of_expiration)
  end
end
