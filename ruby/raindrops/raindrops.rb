class Raindrops
  def self.convert(num)
      out = ''
      out += 'Pling' if  num%3 == 0
      out += 'Plang' if  num%5 == 0
      out += 'Plong' if  num%7 == 0
      out == '' ? (return num.to_s) : (return out)
  end
end

module BookKeeping
  VERSION = 3
end