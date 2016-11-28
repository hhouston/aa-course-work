class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards = Hand.deal_from)
    @cards = cards
  end

  def points
    points = 0
    ace = 0
    @cards.each do |card|
      if card.value == :ace
        ace += 1
        points += 1
      else
        points += card.blackjack_value
      end
    end

    ace.times do
      points += 10 if points + 10 < 22
    end

    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise 'already busted' if busted?
    unless busted?
      @cards += deck.take(1)
    end
  end

  def beats?(other_hand)
    return false if busted?

    other_hand.busted? || points > other_hand.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
