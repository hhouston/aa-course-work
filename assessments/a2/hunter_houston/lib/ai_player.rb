# Represents a computer Crazy Eights player.
class AIPlayer
  attr_reader :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    AIPlayer.new(deck.take(8))
  end

  def initialize(cards = AIPlayer.deal_player_in(Deck.new))
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    # card_hash = Hash.new { |h,k| h[k]=[] }
    diamonds = 0
    spades = 0
    hearts = 0
    clubs = 0
    @cards.each do |card|
      # card_hash[card.suit] =+ 1
      if card.suit == :spades
        spades += 1
      elsif card.suit == :hearts
        hearts += 1
      elsif card.suit == :clubs
        clubs += 1
      else
        diamonds += 1
      end
    end
    if hearts < spades
      :spades
    else
      :hearts
    end
  end

  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    if @cards.include?(card)
      pile.play(card)
      @cards.shift
      if card.value == :eight
        pile.play_eight(card, favorite_suit)
      end
    else
      raise "cannot play card outside your hand"
    end

  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards += deck.take(1)
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    valid_cards = []
    @cards.each do |card|
      # if card.value == pile.value || card.suit == pile.suit || card.value == :eight
      if pile.valid_play?(card) && card.value != :eight
        return card
      end
    end
    @cards.each do |card|
      # if card.value == pile.value || card.suit == pile.suit || card.value == :eight
      if pile.valid_play?(card)
        return card
      end
    end
  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again until there is a valid play.
  # If deck is empty, pass.
  def play_turn(pile, deck)
    # until pile.valid_play?(card)
    #   play_card(pile, card)
      @cards.each do |card|
        if pile.valid_play?(card)
          play_card(pile, card)
          return
        end
      end

      valid_play = false
      until pile.valid_play?( @cards.last )
        draw_from(deck)
      end

      if pile.valid_play?(@cards.last)
        play_card(pile, @cards.last)
      else
        return nil
      end
      # 
      # until count == 0
      #   draw_from(deck)
      # end

  end
end
