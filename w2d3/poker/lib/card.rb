class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
    raise "Invalid suit" unless suits.any? { |el| el == suit}
    raise "Invalid value" if value < 2 || value > 14

    @suit = suit
    @value = value
  end
end
