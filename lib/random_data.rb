module RandomData

  def random_task
    words = []
    rand(1..4).times do
      words << random_word
    end
    words.join(' ')
  end

  def random_password
    password = "#{random_word(rand(8..12))}"
  end

  def random_email
    email = "#{random_word}@#{random_word}.#{random_word(3)}"
  end

  def random_name
    name = "#{random_word.capitalize} #{random_word.capitalize}"
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
