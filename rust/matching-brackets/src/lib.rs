use std::collections::HashMap;

pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = vec![];
    let matching_brackets: HashMap<char, char> =
        [('(', ')'),
        ('[', ']'),
        ('{', '}')]
        .iter().cloned().collect();

    for bracket in string.chars() {
        if ['[', '{', '('].contains(&bracket) {
            stack.push(bracket);
        } else if [']', '}', ')'].contains(&bracket) {
            match stack.pop() {
                None => return false,
                Some(opening_bracket) => {
                    if matching_brackets[&opening_bracket] != bracket { return false; }
                }
            }
        }
    }

    stack.is_empty()
}
