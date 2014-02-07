require_relative 'view.rb'
require_relative 'model.rb'


class Controller
  include ViewModule

  attr_accessor :flashcards
  attr_reader :card
  def initialize
    @flashcards = Model.new('flashcard_samples.txt')
    welcome_message
    check_input(gets.chomp)
  end

  def pull_card
    @card = flashcards.deck[0] #pick the card to display the question
    display_guess_ask(card) #display the question to the user
    guess = gets.chomp
    check_input(guess)
  end

  def check_guess(card, guess)
    card.answer == guess ? return true : false
  end

  def play
    pull_card
  end


  def check_input(input)

    case input
    when 'play'
      pull_card
      play
    when 'quit'
      goodbye_message
    when 'help'
      help_message
      check_input(gets.chomp)
    when card.answer
      correct_answer_message
      flashcards.deck.shuffle!
    else
      dumbass_message
      play
    end
  end

end

flashcard_app = Controller.new()
# flashcard_app.play
# flashcard_app.pull_card
# flashcard_app.pull_card

