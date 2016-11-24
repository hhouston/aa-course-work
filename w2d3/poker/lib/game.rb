require_relative "player"
require_relative "deck"
require_relative "hand"
class Game
  attr_reader :player, :deck, :pot

  def initialize(*players)
    @deck = Deck.new
    @deck.create_deck
    @players = players
    @pot = 0
  end

  def deal_cards
    5.times do
      @players.each do |player|
        player.hand.add_card(deck.deal)
      end
    end
  end

  def play
    deal_cards

    while true
      @players.each do |player|
        next if player.folded
        player.show_hand

        decision = player.decision
        unless decision.nil?
          @pot += decision
        end
      end

      @players.each do |player|
        next if player.folded

        player.show_hand
        player.discard

      end
    end

  end

end

player1 = Player.new("hunter",Hand.new([]),100)
player2 = Player.new("jeff",Hand.new([]),90)
game = Game.new(player1,player2)
game.play
