require_relative 'view.rb'
require_relative 'model.rb'

class Controller
  include ViewModule

  attr_accessor :flashcards, :card
  def initialize(file)
    # There are a few issues here, in my opinion.
    # (1) The name @flashcards doesn't represent its value.  It doesn't hold
    # multiple flashcards, it holds a Deck (@deck).  (2) The controller is
    # currently reaching into the @flashcards object to get a Card object; it knows that
    # @flashcards responds to a method #deck and that the return value responds to
    # a method [].  Remember the Law of Demeter.  Instead, try @flashcards.get_card.
    # (3) All that said, I don't believe there's a need for the controller to hold a specific card
    # in one of its instance variables.  I would not have @card.  In any case, you don't need to
    # assign its value in the initialize method.  That's the first thing the play method does.
    # (4) Lines 22 and 23 could be extracted into another method, maybe begin_play.
    #
    # def initialize(file)
    #   @deck = Deck.new(file)
    #   begin_play
    # end

    @flashcards = Model.new(file)
    @card = flashcards.deck[0]
    welcome_message
    check_input(gets.chomp)
  end

  def pull_card
    # Again, instead of reaching into the deck to get a card, the deck should return a card
    # when sent the right message (e.g., get_card).  Also, I wouldn't set @card, just return a Card.

    self.card = flashcards.deck[0] #pick the card to display the question
  end

  def check_guess(card, guess)
    card.answer == guess
  end

  def play
    # I would set a local variable card equal to pull_card.  Again, the Controller is reaching into the deck object.
    # It's shuffling the deck's cards.  The controller should tell the deck to shuffle, and the deck should implement
    # that itself.  But, all you're really doing is getting a random card.  The pull_card method could call get_card
    # on the deck.  The deck could respond by calling Array#sample on its cards.
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

flashcard_app = Controller.new('flashcard_samples.txt')
