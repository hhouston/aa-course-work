class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    count.times do |i|
      prc.call(self[i])
    end
    self
  end
  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    self_dup = self.dup

    hash2.each do |key, value|
      self_dup[key] = value
    end
    self_dup
  end
end
