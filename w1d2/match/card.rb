require_relative 'board.rb'

class Card
  attr_accessor :value, :face_up
  def initialize(value)
    @face_up = false
    @value = value
  end

  def flip
    @face_up = true
  end

  def ==(card)
    self.value == card.value
  end

end
