require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.values.each do |value|
      Card.suits.each do |suit|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.size
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > count
    return_cards = []
    n.times do
      return_cards << @cards.shift
    end
    return_cards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards
  end
end
