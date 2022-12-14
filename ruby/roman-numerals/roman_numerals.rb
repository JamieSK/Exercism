class Integer  
  def to_roman
    arabic = self
    arabics = {
      1000=>"M", 
      900=>"CM", 
      500=>"D", 
      400=>"CD", 
      100=>"C", 
      90=>"XC", 
      50=>"L", 
      40=>"XL", 
      10=>"X", 
      9=>"IX", 
      5=>"V", 
      4=>"IV", 
      1=>"I"}

    out = ''
    arabics.each {|number, numeral|
      if arabic >= number
        out += numeral * (arabic / number)
        arabic = arabic % number
      end}
    out
  end
end

module BookKeeping
  VERSION = 2
end