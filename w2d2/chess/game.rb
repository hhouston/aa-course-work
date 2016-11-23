require_relative "board"
require_relative "display"
require 'byebug'
class Game

  def initialize
    @board = Board.new
    @display = Display.new
  end

  def play

    @display.render
    while true

      @display.cursor.get_input

      @display.render
    end

  end

  protected

  def notify_players
  end

  def swap_turns

  end
end

game = Game.new

game.play
