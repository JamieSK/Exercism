pub fn collatz(n: u64) -> Option<u64> {
    if n < 1 { return None };

    let mut steps = 0;
    let mut running_total = n;

    while running_total != 1 {
        if running_total % 2 == 0 {
            running_total /= 2;
        } else {
            running_total = 3 * running_total + 1;
        }
        steps += 1;
    }

    Some(steps)
}
