def slices(series, length):
    if length < 1 or length > len(series):
        raise ValueError

    out = []
    for i in range(len(series) - (length - 1)):
        item = []
        for j in series[i:i + length]:
            item.append(int(j))
        out.append(item)

    return out