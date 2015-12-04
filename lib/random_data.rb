module RandomData

  def random_goal
    goal = Faker::Hipster.sentence(rand(2..4))
  end

  def random_password
    password = Faker::Internet.password(8, 12)
  end

  def random_email
    email = Faker::Internet.email
  end

  def random_name
    name = Faker::Name.name
  end

  def random_word(length = nil)
    letters = ('a'..'z').to_a
    letters.shuffle!
    if length
      return letters[0,length].join
    else
      return letters[0,rand(3..8)].join
    end
  end
end
