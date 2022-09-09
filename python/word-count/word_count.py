from re import sub
from collections import Counter

def word_count(string):
    string_array = sub('[^a-zA-Z0-9]+', ' ', string.lower()).strip().split(' ')
    return dict(Counter(string_array))