module ViewModule

  def welcome_message
    puts "Welcome to the Ruby Flashcard App. Type 'quit' to quit anytime. Type 'help' to see options anytime."
  end

  def display_guess_ask(card)
    puts "Question: #{card.question}"
    print "Guess: "
  end

  def correct_answer_message
    puts "Correct!"
  end

  def wrong_answer_message
    puts "Incorrect. Please try again."
    print "Guess: "
  end

  def goodbye_message
    puts "Thank-you for playing. Goodbye!"
  end

  def help_message
    puts "Type 'play' to continue playing the game. Type 'quit' to quit."
  end

  def loser_message
    puts "What? Was that question too hard for you? Really?"
  end

end
