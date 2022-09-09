from re import match

def hey(string):
    if string.isupper():
        return 'Whoa, chill out!'
    elif string.strip() == '':
        return 'Fine. Be that way!'
    elif string.strip()[-1] == '?':
        return 'Sure.'
    else:
        return 'Whatever.'