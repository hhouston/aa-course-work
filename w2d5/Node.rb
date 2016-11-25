class ListNode
  attr_accessor :next, :prev, :key, :value

  def initialize(prev)
    @next = nil
    @prev = prev
    @key = key
    @value = value
  end

  def node(key, value)
    @key = key
    @value = value
  end
end
