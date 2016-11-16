class Tile
  attr_reader :given, :value
  def initialize(value)
    @value = value.to_i
    if @value.zero?
      @given = false
    else @given = true
    end
  end

  def to_s
    @value.to_s
  end

  def value=(new_val)
    @value = new_val unless @given 
  end

end
