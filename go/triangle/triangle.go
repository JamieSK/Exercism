package triangle

import "math"

// Kind represents types of triangle
type Kind string

// Types of triangle.
const (
	NaT = "Not a triangle"
	Equ = "Equilateral"
	Iso = "Isosceles"
	Sca = "Scalene"
)

// KindFromSides returns the type of triangle from its side lengths
func KindFromSides(a, b, c float64) Kind {
	var k Kind
	if isInvalidTriangle(a, b, c) {
		k = NaT
	} else if a == b && b == c {
		k = Equ
	} else if a == b || a == c || b == c {
		k = Iso
	} else {
		k = Sca
	}
	return k
}

func isInvalidTriangle(a, b, c float64) bool {
	return a <= 0 || b <= 0 || c <= 0 ||
		(a+b) < c || (a+c) < b || (b+c) < a ||
		math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) ||
		math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0)
}
