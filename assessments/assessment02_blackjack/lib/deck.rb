require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.values.each do |val|
      Card.suits.each do |suit|
        cards << Card.new(suit, val)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @deck = cards
  end

  # Returns the number of cards in the deck.
  def count
    @deck.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    cards = []
    raise "not enough cards" unless n <= count

    n.times do
      cards << @deck.shift
    end
    cards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @deck += cards
  end
end
