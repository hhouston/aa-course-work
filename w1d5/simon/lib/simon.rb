require 'colorize'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep 3

    system("clear")
    require_sequence

    round_success_message if !game_over
    @sequence_length += 1

  end

  def show_sequence
    add_random_color

    @seq.each do |color|
      puts color.red if color == "red"
      puts color.blue if color == "blue"
      puts color.yellow if color == "yellow"
      puts color.green if color == "green"
    end
  end

  def require_sequence
    sequence_length.times do |color_index|
      puts "enter color (r(ed) b(lue) g(reen) y(ellow))"
      entered_color = gets.chomp

      @game_over = true unless entered_color == seq[color_index][0]
    end
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    "made it past this round.."
  end

  def game_over_message
    puts "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
simon = Simon.new
simon.play
