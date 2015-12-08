FactoryGirl.define do
  factory :user do
    email         { RandomData.random_email }
    password      { RandomData.random_password }
    confirmed_at  { Time.now }
  end
end
