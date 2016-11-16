require_relative 'card.rb'
require 'byebug'

class Board
  attr_reader :grid, :file_name

  def self.default_grid(file_name)
    grid = Array.new(4) { Array.new(4) }
    card_array = self.card_setup(file_name)
    new_card_array = (card_array * 2).shuffle
    (0..3).each do |i|
      (0..3).each do |j|
        p "[#{i},#{j}] is #{new_card_array.last.value}"
        grid[i][j] = new_card_array.pop
      end
    end
    grid
  end

  def initialize(file_name)
    @file_name = file_name
    @grid = self.class.default_grid(@file_name)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def self.card_setup(filename)
    items = File.readlines(filename)
    items.map! { |el| Card.new(el.strip) }
  end

  def display
    (0..3).each do |i|
      print "\n"
      (0..3).each do |j|
        current = @grid[i][j]
        if current.face_up
          print current.value
        else print ' CARD '
        end
      end
    end
  end

  def over?
    @grid.dup.flatten.none? {|el| !el.face_up }
  end

  def random_pos
    rand = Random.new
    row = rand(@grid.length)
    col = rand(@grid.count)
    pos = [row, col]
    p pos
  end


end
