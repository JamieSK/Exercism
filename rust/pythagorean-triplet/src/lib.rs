pub fn find() -> Option<u32> {
    for a in 1u32 ..= 500u32 {
        for b in a ..= 500 {
            for c in b ..= 500 {
                if a + b + c == 1000 && a.pow(2) + b.pow(2) == c.pow(2) {
                    return Some(a * b * c);
                }
            }
        }
    }
    None
}