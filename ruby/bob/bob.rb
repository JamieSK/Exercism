class Bob
  def self.hey string
    testString = string.strip
    return 'Fine. Be that way!' if testString.empty?
    return 'Whoa, chill out!' if testString.upcase! == nil && testString.match(/[a-zA-Z]/)
    return 'Sure.' if testString.end_with?('?')
    'Whatever.'
  end
end

module BookKeeping
  VERSION = 1
end