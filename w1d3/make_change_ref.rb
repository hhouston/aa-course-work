def make_better_change(target, coins)
  return [] if target == 0
  return nil if coins.none? { |coin| coin <= target }

  best_change = nil

  coins.each_with_index do |coin, index|

    remainder = target - coin
    best_remainder = make_better_change(remainder, coins.drop(index))

    next if best_remainder.nil?
    this_change = [coin] + best_remainder


    if best_change.nil? || best_change.count > this_change.count
      best_change = this_change
    end

  end
  best_change
end


p make_better_change(24, [10, 7, 1])
