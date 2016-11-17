def greedy_make_change(amount, coins, coins_used = [])
  # output_array = []
  remaining_amt = amount


  return coins_used if remaining_amt == 0

  if coins.first <= remaining_amt
    remaining_amt -= coins.first
    coins_used << coins.first
  else
    coins.shift
  end

  greedy_make_change(remaining_amt, coins, coins_used)
end
