require_relative 'view.rb'
require_relative 'model.rb'


class Controller
  include ViewModule

  attr_accessor :flashcards, :card
  def initialize
    @flashcards = Model.new('flashcard_samples.txt')
    @card = flashcards.deck[0]
    welcome_message
    check_input(gets.chomp)
  end

  def pull_card
    self.card = flashcards.deck[0] #pick the card to display the question
  end

  def check_guess(card, guess)
    card.answer == guess
  end

  def play
    pull_card
    flashcards.deck.shuffle!
    display_guess_ask(card)
    check_input(gets.chomp)
  end


  def check_input(input)

    case input
    when 'play'
      play
    when 'quit'
      goodbye_message
    when 'help'
      help_message
      check_input(gets.chomp)
    when 'skip'
      loser_message
      play
    when card.answer
      correct_answer_message
      play
    else
      wrong_answer_message
      check_input(gets.chomp)
    end
  end

end

flashcard_app = Controller.new()
# flashcard_app.play
# flashcard_app.pull_card
# flashcard_app.pull_card

