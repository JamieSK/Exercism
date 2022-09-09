class Prime
  def self.nth(n)
    raise ArgumentError if n == 0
    @array = (2..105000).to_a
    @array.each_with_index {|prime,index| index + 1 == n ? (return prime) : (@array.delete_if {|potential| potential % prime == 0 && potential != prime})}
  end
end

module BookKeeping
  VERSION = 1
end