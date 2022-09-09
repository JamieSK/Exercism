class Grains

  def self.square squareInt
    raise ArgumentError if squareInt < 1 || squareInt > 64
    @chessboard = [1]
    while @chessboard.length < 64
      @chessboard.push(@chessboard.last * 2)
    end
    @chessboard[squareInt - 1]
  end

  def self.total
    @chessboard.sum
  end
end

module BookKeeping
  VERSION = 1
end