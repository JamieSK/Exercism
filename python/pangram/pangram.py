from string import ascii_lowercase

def is_pangram(string):
    alphabet = set(ascii_lowercase)
    for letter in string:
        alphabet.discard(letter.lower())
    return len(alphabet) == 0