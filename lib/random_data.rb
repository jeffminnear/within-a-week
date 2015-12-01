module RandomData

  def random_task
    words = []
    rand(1..4).times do
      words << random_word
    end
    words.join(" ")
  end

  def random_name
    name = []
    2.times do
      name << random_word.capitalize!
    end
    name.join(" ")
  end

  def random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
