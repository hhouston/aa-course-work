class Player
  attr_reader :wallet, :hand, :name, :folded
  def initialize(name, hand, wallet)
    @name = name
    @hand = hand
    @wallet = wallet
    @folded = false
  end

  def discard
    puts "#{name} do you want to discard? y/n"
    response = gets.chomp
    if response == "y"
      puts "select the index of the cards you wish to discard ex. (1,2)"
      index = gets.chomp.split(",").map(&:to_i)
      p index
    else
      puts "ok cool"
    end
  end

  def decision

    puts"enter b: bet | c: check | x: fold"
    case gets.chomp
    when "b"
      puts "enter best amount"
      bet = gets.chomp.to_i
      @wallet -= bet
      bet
    when "c"
      puts "check"
      nil
    when "x"
      puts "bye"
      folded
      @hand = []
      nil
    else
      raise 'error'
    end
  rescue
    retry
  end

  def folded
    @folded = true
  end
end
