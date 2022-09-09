package bob

import "strings"

// Hey models a begrudging conversational partner.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	isQuestion := strings.HasSuffix(remark, "?")
	isShouting := remark == strings.ToUpper(remark) && strings.ContainsAny(remark, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
	
	if isQuestion && isShouting {
		return "Calm down, I know what I'm doing!"
	} else if isQuestion {
		return "Sure."
	} else if isShouting {
		return "Whoa, chill out!"
	} else if remark == "" {
		return "Fine. Be that way!"
	} else {
		return "Whatever."
	}
}
