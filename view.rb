class View

  def initialize

  end

  def welcome_message
    puts "Welcome to the Ruby Flashcard App"
  end

  def display_guess_ask
    puts "#{model.deck[0].question}"
    puts "Guess:"
  end

  def correct_answer_message

  end

  def wrong_answer_message

  end

  def goodbye_message

  end
end
