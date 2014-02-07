class Model
  attr_accessor :deck

  def initialize
    @deck = []
  end

  def parser(file)
    File.open(file).each_slice(3) do |line|
      self.deck << Card.new(line)
    end
    # deck
  end
end

class Card
  attr_reader :question, :answer

  def initialize(attributes)
    @question = attributes[0]
    @answer = attributes[1]
  end
end

model = Model.new
model.parser('flashcard_samples.txt')
# model.deck
