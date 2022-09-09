// Package twofer provides a ShareWith function
package twofer

import "fmt"

// ShareWith returns "One for you, one for me." unless
// given a name then will return the name instead of "you"
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
