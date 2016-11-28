require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    self.each do |k, v|
      return true if key == k
    end

    false
  end

  def set(key, val)
    resize! if @count >= num_buckets

    hashed_key = key.hash
    spot = hashed_key % num_buckets
    if @store[spot].include?(key)
      @store[spot].update(key, val)
    else
      @store[spot].append(key, val)
      @count += 1
    end
  end

  def get(key)
    hashed_key = key.hash
    spot = hashed_key % num_buckets
    @store[spot].get(key)
  end

  def delete(key)
    hashed_key = key.hash
    spot = hashed_key % num_buckets
    @store[spot].remove(key)
    @count -= 1
  end

  def each
    @store.each do |bucket|
      bucket.each do |list|
        yield(list.key, list.val)
      end
    end

    self
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets*2) { LinkedList.new }
    @store.each do |bucket|
      bucket.each do |link|
        key_hashed = link.key.hash
        spot = key_hashed % new_store.size
        new_store[spot].append(link.key, link.val)
      end
    end

    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end


end
