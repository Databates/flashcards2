class Model # A better name would be Deck
  attr_accessor :deck
  attr_reader :file

  def initialize(file)
    # First, @deck should be renamed to something like @cards; that's what it holds.
    # Second, there's no need to save the filename to an instance variable, and
    # @deck doesn't need to be set to an empty array.  Just set it to the value of parser.
    #
    # def initialize(file)
    #   @cards = parser(file)
    # end

    @file = file
    @deck = []
    parser
  end

  def parser
    # The name could be improved, maybe something like parse_file_to_cards,
    # if you want it coupled to the Card model.
    # This method could be moved to a parsing module.

    File.open(file).each_slice(3) { |line| self.deck << Card.new(line) }
  end
end

class Card
  attr_reader :question, :answer

  def initialize(attributes)
    # The attributes are coming in as an array.  Therefore, any object instantiating a
    # Card object has to know how to order the elements.

    @question = attributes[0].chomp
    @answer = attributes[1].chomp
  end
end
