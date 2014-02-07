class Model
  attr_accessor :deck
  attr_reader :file

  def initialize(file)
    @file = file
    @deck = []
    parser
  end

  def parser
    File.open(file).each_slice(3) { |line| self.deck << Card.new(line) }
  end
end

class Card
  attr_reader :question, :answer

  def initialize(attributes)
    @question = attributes[0].chomp
    @answer = attributes[1].chomp
  end
end
