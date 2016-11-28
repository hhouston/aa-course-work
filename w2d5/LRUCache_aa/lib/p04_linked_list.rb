require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev if @next
    @prev.next = @next if @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil? && @tail.nil?
  end

  def get(key, curr_link = @head)
    return nil if empty?
    return curr_link.val if curr_link.key == key
    return nil if curr_link == @tail

    get(key, curr_link.next)
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end
    false
  end

  def append(key, val)
    if include?(key)
      update(key, val)
    else
      node = Link.new(key, val)

      node.prev = @tail
      @tail = node
      if @head
        node.prev.next = node
      else
        @head = node
      end
    end
  end

  def update(key, val, curr_link = @head)
    return nil if empty?
    if curr_link.key == key
      curr_link.val = val
    end

    return nil if curr_link.next.nil?

    update(key, val, curr_link.next)
  end

  def remove(key, curr_link = @head)
    return nil if empty?

    if curr_link.key == key
      curr_link.next.prev = curr_link.prev unless curr_link.next.nil?
      curr_link.prev.next = curr_link.next unless curr_link.prev.nil?
      curr_link.val = nil
    end

    return nil if curr_link == @tail

    remove(key, curr_link.next)
  end

  def each(&prc)
    curr_link = @head
    until curr_link.nil?
      prc.call(curr_link)
      curr_link = curr_link.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
