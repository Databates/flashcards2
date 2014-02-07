require_relative 'view.rb'
require_relative 'model.rb'


class Controller

  def initialize
    flashcards = Model.new()
    flashcards_ui = View.new()
  end

  def pull_card
    card = flashcards.deck[0] #pick the card to display the question
    flashcards_ui.display_guess_ask(card) #display the question to the user
    guess = gets.chomp

    until check_guess(card, guess) == true
      flashcards_ui.wrong_answer_message
      pull_card
    end

    flashcards_ui.correct_answer_message
    flashcards.remove_card
  end

  def check_guess(card, guess)
    if flashcards.card.answer == guess
      true
    else
      false
    end
  end

end
