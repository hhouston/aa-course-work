require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'player.rb'

class Game
  attr_reader :player
  def initialize(file_name)
    @board = Board.new(file_name)
    @player = Player.new("Hunter")
  end

  def play
    until @board.over?
      take_turn
    end
    print 'YOU WIN'
  end

  def take_turn
    @board.display

    puts "\nenter 1st guess(x,y): "
    pos_1 = @player.get_guess
    puts "card is #{@board[pos_1].value}"

    puts "enter 2nd guess(x, y): "
    pos_2 = @player.get_guess
    puts "card is #{@board[pos_2].value}"

    if @board[pos_1] == @board[pos_2]
      puts 'Match found!'
      @board[pos_1].flip
      @board[pos_2].flip
    else print 'Those cards dont match'
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    file_name = ARGV.shift
  else
    file_name = 'cards.txt'
  end
  @game = Game.new(file_name)
  @game.play
end
