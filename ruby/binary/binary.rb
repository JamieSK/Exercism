class Binary
  def self.to_decimal binary
    raise ArgumentError if binary.match(/[^01]/)
    out = 0
    (0...binary.length).each {|index| out += binary.reverse[index].to_i * (2**index.to_i)}
    out
  end
end

module BookKeeping
  VERSION = 3
end