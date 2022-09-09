pub fn encode(source: &str) -> String {
    let mut output = String::new();

    let mut current_char: Option<char> = None;
    let mut current_count = 0;
    let mut chars = source.chars();
    loop {
        let c_option = chars.next();
        match c_option {
            Some(c) => {
                match current_char {
                    None => {
                        current_char = Some(c);
                        current_count += 1;
                    },
                    Some(other_c) if other_c == c => current_count += 1,
                    Some(other_c) => {
                        if current_count > 1 {
                            output.push_str(&format!("{}{}", current_count, other_c));
                        } else {
                            output.push(other_c);
                        }
                        current_count = 1;
                        current_char = Some(c);
                    }
                }
            },
            None => {
                if current_count > 1 {
                    output.push_str(&format!("{}{}", current_count, current_char.unwrap()));
                } else if current_char.is_some() {
                    output.push(current_char.unwrap());
                }
                break;
            }
        }
    }

    output
}

pub fn decode(source: &str) -> String {
    let mut output = String::new();
    let mut chars = source.chars().peekable();

    loop {
        let first_char = chars.next();
        match first_char {
            None => break,
            Some(c) if !c.is_ascii_digit() => output.push(c),
            Some(c) => {
                let mut number = c.to_string();
                while chars.peek().expect("String ends in number.").is_ascii_digit() {
                    number.push(chars.next().expect("String ends in number."));
                }
                let letter = chars.next().expect("String ends in number.");
                output.push_str(
                    &letter.to_string().repeat(
                        number.parse::<usize>().expect("Char isn't alphanumeric")))
            }
        }
    }

    output
}
