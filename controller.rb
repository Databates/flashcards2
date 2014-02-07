require_relative 'view.rb'
require_relative 'model.rb'


class Controller

  def initialize

  end

  def pull_card
    card = model.deck[0] #pick the card to display the question
    view.display_guess_ask #display the question to the user
    guess = gets.chomp
    if check_guess(card, guess) # if the user guessed correctly
      view.correct_answer_message
    else
      view.wrong_answer_message
    end
  end

  def check_guess(card, guess)
    if model.card.answer == guess
      true
    else
      false
    end
  end

end
