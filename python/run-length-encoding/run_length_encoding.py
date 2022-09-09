from re import sub

def decode(string):
    def code_replace(match_object):
        return int(match_object.group(1)) * str(match_object.group(2))
    return sub(r'(\d+)(.)', code_replace, string)


def encode(string):
    def run_replace(match_object):
        return str(len(match_object.group(0))) + str(match_object.group(1)[0])
    return sub(r'((.)\2+)', run_replace, string)