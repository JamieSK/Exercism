def rotate(text, key):
    out = ''
    for letter in text:
        if letter.isalpha():
            if letter.islower():
                out += chr((((ord(letter) - 97) + key) % 26) + 97)
            else:
                out += chr((((ord(letter) - 65) + key) % 26) + 65)
        else:
            out += letter
    return out