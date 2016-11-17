class Array
  def deep_dup
    output = []
    self.each do |el|
      if el.is_a?(Array)
        output << el.dup_help
      else
        output << el
      end
    end
    output
  end

  def dup_help
    return [self.last] if self.length == 1
    [self.first] + self[1..-1].dup_help
  end
end
