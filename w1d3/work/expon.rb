def expon_rec(base, power)
  return 1 if power == 0

  base * expon_rec(base, power - 1)

end

def rec(base, power)
  return 1 if power == 0
  return base if power ==1

  if power.even?
    rec(base, power/2) *rec(base, power/2)
  else
    base * (rec(base, (power-1) / 2)* (rec(base, (power-1) /2)))
  end

end

p rec(2,3)
p rec(5,6)
p rec(3,4)
