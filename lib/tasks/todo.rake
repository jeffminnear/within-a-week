namespace :todo do
  desc "Delete goals older than seven days"
  task delete_goals: :environment do
    Goal.expired.destroy_all
  end
end
