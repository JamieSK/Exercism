extern crate regex;
use regex::Regex;
use std::ascii::AsciiExt;

pub fn reply(message: &str) -> &str {
    let has_letters = Regex::new(r"[a-zA-Z]").unwrap();
    let trimmed = message.trim();

    if trimmed.to_ascii_uppercase() == trimmed.to_string() && has_letters.is_match(trimmed) {
        return "Whoa, chill out!";
    } else if trimmed.to_string().ends_with('?') {
        return "Sure.";
    } else if trimmed == "" {
        return "Fine. Be that way!";
    } else {
        return "Whatever.";
    }
}