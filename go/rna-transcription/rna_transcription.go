package strand

// ToRNA converts a DNA string to RNA
func ToRNA(dna string) string {
	result := ""
	for index := 0; index < len(dna); index++ {
		switch dna[index] {
		case 'G':
			result += "C"
		case 'C':
			result += "G"
		case 'T':
			result += "A"
		case 'A':
			result += "U"

		}
	}
	return result
}
