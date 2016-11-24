
class Hand

  attr_reader :hand

  def initialize(hand_array)
    @hand = hand_array
  end

  def add_card(card)
    @hand << card
  end

  def delete_card(card)
    @hand.delete(card)
  end

  def hand_strength
    return 10 if royal_flush?
    return 9 if straight_flush?
    return 8 if four_of_a_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_of_kind?
    return 3 if two_pair?
    return 2 if pair?
    return 1
  end

  def royal_flush?
    values = @hand.map { |card| card.value }.sort
    suits = @hand.map { |card| card.suit }

    flush_test = suits.uniq.length == 1
    values_test = (10..14).to_a == values.sort

    flush_test && values_test
  end

  def straight_flush?

    values = @hand.map { |card| card.value }.sort
    suits = @hand.map { |card| card.suit }

    4.times do |i|
      return false if (values[i]+1) != values[i+1]
    end

    suits.uniq.length == 1 ? true : false
  end

  def four_of_a_kind?
    values = @hand.map { |card| card.value }
    duplicates = values.select { |el| values.count(el) == 4 }.uniq
    duplicates.length == 1 ? true : false
  end

  def full_house?
    values = @hand.map { |card| card.value }

    triples = values.select { |el| values.count(el) == 3 }.uniq
    doubles = values.select { |el| values.count(el) == 2 }.uniq

    return true unless triples.empty? || doubles.empty?
    false

  end

  def flush?
    suits = @hand.map { |card| card.suit }
    flush_test = suits.uniq.length == 1
    return true if flush_test
    false
  end

  def straight?

    values = @hand.map { |card| card.value }.sort
    4.times do |i|
      return false if (values[i]+1) != values[i+1]
    end
    true
  end

  def three_of_kind?
    values = @hand.map { |card| card.value }
    duplicates = values.select { |el| values.count(el) == 3 }.uniq
    duplicates.length == 1 ? true : false
  end

  def two_pair?
    values = @hand.map { |card| card.value }
    duplicates = values.select { |el| values.count(el) == 2 }.uniq
    duplicates.length == 2 ? true : false
  end

  def pair?
    values = @hand.map { |card| card.value }

    duplicates = values.select { |el| values.count(el) == 2 }.uniq

    duplicates.empty? ? false : true
  end

  def show_hand
    values = @hand.map { |card| card.value }
    suits = @hand.map { |card| card.suit }

    values.length.times do |i|
      puts "#{values[i]} of #{suits[i]}"
    end
  end
  # def high_card
  #   values = @hand.map { |card| card.value }
  #   temp_el = 0
  #   high_card = values.select { |el| temp_el = el if el > temp_el}
  #   high_card
  # end


end
