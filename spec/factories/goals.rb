FactoryGirl.define do
  factory :goal do
    name RandomData.random_goal
    user
  end
end
