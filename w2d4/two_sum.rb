def two_sum?(arr)
  hash_map = { }

  arr.each { |el| hash_map[el] = true }
  arr.each do |el|
    return true if hash_map[0-el]
  end
  false
end

def max_windowed_range(array, window)
  current_max_range = nil
  array.each_index do |i|
    current_window = array[i...(i + window)]
    if current_max_range.nil? || current_window.max - current_window.min > current_max_range
      current_max_range = current_window.max - current_window.min
    end
  end

  current_max_range
end


p max_windowed_range([1, 3, 2, 5, 4, 8], 2)


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first

  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push
    @store.push
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @queue = MyQueue.new
  end
  
  def enqueue
    stack = MyStack.new
    @queue << stack
  end

  def dequeue
    @queue.shift
  end

  def size
    @queue.size
  end

  def empty?
    @queue.empty?
  end
end
