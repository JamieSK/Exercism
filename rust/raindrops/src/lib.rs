pub fn raindrops(n: usize) -> String {
    let s1;
    let s2;
    let s3;
    if n % 3 == 0 {
        s1 = String::from("Pling");
    } else {
        s1 = String::from("");
    }
    if n % 5 == 0 {
        s2 = String::from("Plang");
    } else {
        s2 = String::from("");
    }
    if n % 7 == 0 {
        s3 = String::from("Plong");
    } else {
        s3 = String::from("");
    }
    let out = format!("{}{}{}", s1, s2, s3);
    if out == "" {
        return String::from(n.to_string());
    } else {
        return out;
    }
}