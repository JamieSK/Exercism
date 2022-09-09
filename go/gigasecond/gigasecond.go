package gigasecond

import "time"

const gigasecond time.Duration = time.Second * time.Duration(1000000000)

// AddGigasecond adds 10^9 seconds to a given time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(gigasecond)
}
