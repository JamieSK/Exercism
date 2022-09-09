package collatzconjecture

import "fmt"

// CollatzConjecture returns the number of steps to get to 1
func CollatzConjecture(i int) (int, error) {
	if i < 1 {
		return -1, fmt.Errorf("Must be a positive value")
	}

	steps := 0
	for i > 1 {
		steps++
		if i%2 == 0 {
			i /= 2
		} else {
			i = 3*i + 1
		}
	}
	return steps, nil
}
