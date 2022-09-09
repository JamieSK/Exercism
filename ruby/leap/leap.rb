class Year
  def self.leap? yearInt
    (yearInt % 4 == 0) && (yearInt % 100 != 0 || yearInt % 400 == 0)
    # year is divisible by 4, but not by 100 unless also by 400.
  end
end

module BookKeeping
  VERSION = 3
end