class Phrase
  def initialize string
    @phrase = string.downcase
  end

  def word_count
    @count = {}
    @words = @phrase.scan(/(\w+'?\w+|\d+)/).flatten
    @words.each {|word| @count[word] = @words.count(word)}
    @count
  end
end

module BookKeeping
  VERSION = 1
end