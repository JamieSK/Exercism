class Complement
  def self.of_dna(dna)
    dna_to_rna = {'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}
    rna = dna.chars.to_a.map {|n| n = dna_to_rna[n]}.join
    if rna.length == dna.length
      rna
    else
      ''
    end
  end
end

module BookKeeping
  VERSION = 4
end