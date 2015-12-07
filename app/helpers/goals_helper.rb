module GoalsHelper
  def time_left_until_expires(goal)
    time_of_expiration = goal.created_at + 7.days
    if Time.now < time_of_expiration
      time_left_until_expiration = distance_of_time_in_words(Time.now, time_of_expiration)
      return "#{time_left_until_expiration} left to complete"
    else
      return "EXPIRED!"
    end
  end
end
