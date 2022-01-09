def solution(n):
    bin_n = bin(n).count("1")
    while True:
        n += 1
        if bin(n).count("1") == bin_n:
            return n
