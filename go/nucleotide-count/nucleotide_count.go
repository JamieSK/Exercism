package dna

import "fmt"

// Histogram is buckets for nucleotides in DNA
type Histogram map[rune]int

// DNA is a string representation of DNA
type DNA string

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (Histogram, error) {
	var h Histogram = map[rune]int{
		'A': 0,
		'C': 0,
		'G': 0,
		'T': 0,
	}
	var resultError error = nil
	for _, nucleotide := range d {
		switch nucleotide {
		case 'A':
			h['A']++
		case 'C':
			h['C']++
		case 'G':
			h['G']++
		case 'T':
			h['T']++
		default:
			resultError = fmt.Errorf("Includes invalid nucleotides")
		}
	}
	return h, resultError
}
