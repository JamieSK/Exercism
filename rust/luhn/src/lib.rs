/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let stripped_string = code.replace(" ", "");
    if stripped_string.len() < 2 { return false; }

    stripped_string.chars().rev().enumerate().fold(0, luhn_checksum) % 10 == 0
        && stripped_string.chars().all(|c| c.is_ascii_digit())
}

fn luhn_checksum(acc: i32, (i, character): (usize, char)) -> i32 {
    let num = character.to_digit(10).unwrap_or(0);
    if i % 2 != 0 {
        acc + match num + num {
            number if number > 9 => number as i32 - 9,
            number => number as i32,
        }
    } else {
        acc + num as i32
    }
}
