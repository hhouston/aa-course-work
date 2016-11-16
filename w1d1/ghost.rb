require 'byebug'

class Game
  attr_reader :current_player, :previous_player, :dictionary, :fragment

  def initialize(players, file_name)
    @current_player, @previous_player = players
    @fragment = ""
    @dictionary = make_dictionary(file_name)
  end

  def make_dictionary(file_name)
    dictionary_hash = {}
    File.foreach(file_name) do |line|
      dictionary_hash[line.chomp] = true
    end
    dictionary_hash
  end

  def play_round
    until dictionary[@fragment]
      #debugger
      next_player!
      take_turn(@current_player)
    end

    puts "#{@current_player} point"
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
    # debugger
    puts "#{@current_player.name} it's your turn."
  end

  def take_turn(player)
    letter = player.guess
    if valid_play?(letter)
      @fragment << letter
      puts "The fragment is #{@fragment}"
    else
      puts "Letter invalid. Pick another."
      take_turn(player)
    end
  end

  def valid_play?(letter)
    temp_fragment = @fragment + letter

    @dictionary.keys.any? do |word|
      word[0...temp_fragment.length] == temp_fragment
    end
  end
end

class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    file_name = ARGV.shift
    player_1 = Player.new("Raku")
    player_2 = Player.new("Hunter")
    game = Game.new([player_1, player_2], file_name)
    game.play_round
  end
end
