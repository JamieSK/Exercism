class Sieve
  def initialize integer
    @array = (2..integer).to_a
  end

  def primes
    @array.each {|prime| @array.delete_if {|potential| potential % prime == 0 && potential != prime}}
  end
end

module BookKeeping
  VERSION = 1
end