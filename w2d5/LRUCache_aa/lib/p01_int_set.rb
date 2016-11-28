class MaxIntSet
  attr_reader :max
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
  end
end


class IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { [] }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    spot = num % @num_buckets
    @store[spot]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets

    self[num] << num
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    spot = num % num_buckets
    @store[spot]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # if @count == num_buckets
    #   temp_store = @store.deep_dup
    #   new_set = ResizingIntSet.new(num_buckets * 2)
    #   temp_store.each do |bucket|
    #     bucket.each do |item|
    #       new_set.insert(item)
    #     end
    #   end
    # end

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
