pub fn nth(n: i32) -> Result<i32, i32> {
    if n < 1 { return Err(0); };

    let mut primes = vec![2];
    let mut next = 2;

    while (primes.len() as i32) < n {
        let mut is_prime = true;
        next += 1;

        for prime in &primes {
            if next % prime == 0 {
                is_prime = false;
            }
        }
        if is_prime {
            primes.push(next);
        }
    }
    let last_prime: i32 = primes[primes.len() - 1];
    return Ok(last_prime);
}