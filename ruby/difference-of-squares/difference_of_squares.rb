class Squares
  def initialize number
    @array = (1..number).to_a
  end

  def square_of_sum
    @array.sum**2
  end

  def sum_of_squares
    @array.map {|i| i*i}.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4
end