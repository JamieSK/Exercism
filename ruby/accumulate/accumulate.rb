class Array
  def accumulate &block
    out = []
    if block.nil?
      self.to_enum
    else
      self.each {|element| out << block.call(element)}
      out
    end
  end
end

module BookKeeping
  VERSION = 1
end