require_relative 'view.rb'
require_relative 'model.rb'


class Controller
  include ViewModule

  attr_accessor :flashcards
  def initialize
    @flashcards = Model.new('flashcard_samples.txt')
  end

  def pull_card
    card = flashcards.deck[0] #pick the card to display the question
    display_guess_ask(card) #display the question to the user
    guess = gets.chomp

    until check_guess(card, guess) == true
      wrong_answer_message
      pull_card
    end

    correct_answer_message
    flashcards.shuffle
  end

  def check_guess(card, guess)
    if card.answer == guess
      true
    else
      false
    end
  end

end

flashcard_app = Controller.new()
flashcard_app.pull_card
