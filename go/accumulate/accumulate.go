package accumulate

// Accumulate maps an array of strings with a conversion function
func Accumulate(strings []string, converter func(string) string) []string {
	result := []string{}
	for index := 0; index < len(strings); index++ {
		result = append(result, converter(strings[index]))
	}
	return result
}