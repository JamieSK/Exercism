from collections import Counter


def detect_anagrams(word, candidates):
    word_count = Counter(word.lower())
    out = []
    for candidate in candidates:
        if Counter(candidate.lower()) == word_count and candidate.lower() != word.lower():
            out.append(candidate)
    return out