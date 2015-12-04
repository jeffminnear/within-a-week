include RandomData

# Create Users
20.times do
  user = User.create!(
    email:            RandomData.random_email,
    password:         RandomData.random_password,
    confirmed_at:     RandomData.random_time,
    last_sign_in_at:  RandomData.random_time
  )
end
users = User.all

# Create Goals
100.times do
  goal = Goal.create!(
    name:             RandomData.random_goal,
    user:             users.sample,
    created_at:       RandomData.random_time
  )
end

# Create my User
my_user = User.create!(
  email: "jeffminnear@gmail.com",
  password: "helloworld",
  confirmed_at: Time.now
)

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Goal.count} goals created"
