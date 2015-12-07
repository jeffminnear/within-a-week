namespace :todo do
  desc "Delete goals older than seven days"
  task delete_goals: :environment do
    Goal.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
