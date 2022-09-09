class Pangram
  def self.pangram?(string)
    ('a'..'z').all? {|letter| string.downcase.include?(letter)}
  end
end

module BookKeeping
  VERSION = 5
end