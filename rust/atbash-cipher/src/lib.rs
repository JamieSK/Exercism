/// "Encipher" with the Atbash cipher.
pub fn encode(plain: &str) -> String {
    enchunk(&atbash_shift(&plain.to_ascii_lowercase()))
}

/// "Decipher" with the Atbash cipher.
pub fn decode(cipher: &str) -> String {
    atbash_shift(cipher)
}

fn enchunk(input: &str) -> String {
    let mut output = String::from(input);
    for i in (5..(output.len() - 1 + output.len() / 5)).step_by(6) {
        output.insert_str(i, " ");
    }
    output
}

fn atbash_shift(input: &str) -> String {
    let alphabet = vec!['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
    input.chars().map(|c| {
        if c.is_ascii_digit() {
            return c;
        }
        match alphabet.iter().position(|&d| d == c) {
            None => '*',
            Some(n) => alphabet[alphabet.len() - 1 - n],
        }
    }).collect::<String>().replace("*", "")
}
