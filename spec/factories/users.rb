include RandomData

FactoryGirl.define do
  my_password = RandomData.random_password
  my_email = RandomData.random_email

  factory :user do
    email my_email
    password my_password
  end
end
