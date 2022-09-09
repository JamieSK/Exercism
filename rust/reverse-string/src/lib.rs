pub fn reverse(s: &str) -> String {
    let mut out = "".to_string();
    for char in s.chars().rev() {
        out.push(char);
    }
    out
}