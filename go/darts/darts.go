package darts

import "math"

// Score calculates the score for a darts game from the x and y coordinates
func Score(x, y float64) int {
	distanceFromCentre := math.Sqrt(math.Pow(x, 2) + math.Pow(y, 2))
	if distanceFromCentre <= 1 {
		return 10
	} else if distanceFromCentre <= 5 {
		return 5
	} else if distanceFromCentre <= 10 {
		return 1
	} else {
		return 0
	}
}