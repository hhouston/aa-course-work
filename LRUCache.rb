class LRUCache
  def initialize(size)
    @size = size
    @john = []
  end

  def count
    # returns number of elements currently in cache
    p @john.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @john.include?(el)
      @john.delete(el)
      @john << el
    elsif count >= @size
      @john.shift
      @john << el
    else
      @john << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @john
    nil
  end

  private
  # helper methods go here!


end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2
#
# johnny_cache.add([1,2,3])
# johnny_cache.add(5)
# johnny_cache.add(-5)
# johnny_cache.add({a: 1, b: 2, c: 3})
# johnny_cache.add([1,2,3,4])
# johnny_cache.add("I walk the line")
# johnny_cache.add(:ring_of_fire)
# johnny_cache.add("I walk the line")
# johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show #
