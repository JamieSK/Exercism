package listops

// IntList is a list of ints
type IntList []int

// Foldl is a method
func (obj IntList) Foldl(fn func(x, y int) int, initial int) int {
	for _, num := range obj {
		initial = fn(initial, num)
	}
	return initial
}

// Foldr is a method
func (obj IntList) Foldr(fn func(x, y int) int, initial int) int {
	for index := len(obj) - 1; index >= 0; index-- {
		initial = fn(obj[index], initial)
	}
	return initial
}

// Filter is a method
func (obj IntList) Filter(fn func(n int) bool) IntList {
	result := []int{}
	for _, num := range obj {
		if fn(num) {
			result = append(result, num)
		}
	}
	return result
}

// Length is a method
func (obj IntList) Length() int {
	result := 0
	for range obj {
		result++
	}
	return result
}

// Map is a method
func (obj IntList) Map(fn func(x int) int) IntList {
	result := []int{}
	for _, num := range obj {
		result = append(result, fn(num))
	}
	return result
}

// Reverse is a method
func (obj IntList) Reverse() IntList {
	result := []int{}
	for index := len(obj) - 1; index >= 0; index-- {
		result = append(result, obj[index])
	}
	return result
}

// Append is a method
func (obj IntList) Append(suffix IntList) IntList {
	return append(obj, suffix...)
}

// Concat is a method
func (obj IntList) Concat(args []IntList) IntList {
	for _, arg := range args {
		obj = append(obj, arg...)
	}
	return obj
}