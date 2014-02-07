class View

  def initialize

  end

  def welcome_message
    puts "Welcome to the Ruby Flashcard App"
  end

  def display_guess_ask(card)
    puts "#{model.card.question}"
    puts "Guess:"
  end

  def correct_answer_message
    puts "Correct!"
  end

  def wrong_answer_message
    puts "Incorrect. Please try again."
  end

  def goodbye_message
    puts "Thank-you for playing. Goodbye!"
  end
end
