def distance(string1, string2):
    if len(string1) != len(string2): raise ValueError

    count = 0
    for index in range(len(string1)):
        if string1[index] != string2[index]:
            count += 1
    return count