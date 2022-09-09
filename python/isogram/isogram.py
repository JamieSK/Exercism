def is_isogram(string):
    string = string.lower()
    for letter in string:
        if letter == ' ' or letter == '-':
            continue
        if string.lower().count(letter) > 1:
            return False
    return True