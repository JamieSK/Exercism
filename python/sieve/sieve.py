def sieve(limit):
    result = list(range(2, limit + 1))

    for prime in result:
        for potential in result:
            if potential % prime == 0 and potential != prime:
                result.remove(potential)

    return result