require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= num_buckets
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    spot = num.hash % num_buckets
    @store[spot]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.size * 2) { [] }
    @store.each do |bucket|
      bucket.each do |item|
        spot = item % new_store.size
        new_store[spot].push(item)
      end
    end

    @store = new_store
  end
end
