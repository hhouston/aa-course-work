class Player
  def initialize(name)
    @name = name
  end

  def get_guess
    guess = gets.chomp
    row = guess.scan(/\d/)[0].to_i
    col = guess.scan(/\d/)[1].to_i
    [row, col]
  end

end
