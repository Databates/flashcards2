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
  end

  def goodbye_message
    puts "Thank-you for playing. Goodbye!"
  end

  def help_message
    puts "Reminder: Don't be a dumbass."
  end

  def dumbass_message
    puts "Wtf was that? Type in a real command."
  end

end
