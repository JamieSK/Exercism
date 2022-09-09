package acronym

import "strings"

// Abbreviate turns a phrase into an acronym
func Abbreviate(s string) string {
	s = strings.ReplaceAll(s, "-", " ")
	s = strings.ReplaceAll(s, "_", "")
	s = strings.ReplaceAll(s, "-", "")
	s = strings.ReplaceAll(s, "'", "")

	words := strings.Split(s, " ")
	acronym := ""
	for _, word := range words {
		if word != "" {
			acronym += strings.ToUpper(string(word[0]))
		}
	}
	return acronym
}
