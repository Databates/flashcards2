require_relative 'view.rb'
require_relative 'model.rb'


class Controller

  def initialize

  end

  def pull_card
    card = model.deck[0] #pick the card to display the question
    view.display_guess_ask #display the question to the user
    guess = gets.chomp

    until check_guess(card, guess) == true
      view.wrong_answer_message
      pull_card
    end

    view.correct_answer_message
    model.move_card_to_bottom_of_deck
  end

  def check_guess(card, guess)
    if model.card.answer == guess
      true
    else
      false
    end
  end

end
