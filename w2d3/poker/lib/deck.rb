require_relative 'card'
class Deck
  attr_reader :deck
  SUITES = ['Hearts','Diamonds','Spades','Clubs'].freeze


  def initialize
    @deck = []
    create_deck
  end

  def create_deck

    (2..14).each do |val|
      SUITES.each do |suite|
        card = Card.new(suite, val)
        @deck << card
      end
    end
  end

  def shuffle
    @deck = deck.shuffle
  end

  def deal
    raise 'deck empty' if deck.empty?
    deck.shift
  end
end
