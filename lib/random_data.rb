module RandomData

  def self.random_time
    time = Faker::Time.backward(10)
  end

  def self.random_goal
    goal = Faker::Hipster.sentence(rand(2..4))
  end

  def self.random_password
    password = Faker::Internet.password(8, 12)
  end

  def self.random_email
    email = Faker::Internet.email
  end

  def self.random_name
    name = Faker::Name.name
  end

  def self.random_word(length = nil)
    letters = ('a'..'z').to_a
    letters.shuffle!
    if length
      return letters[0,length].join
    else
      return letters[0,rand(3..8)].join
    end
  end
end
