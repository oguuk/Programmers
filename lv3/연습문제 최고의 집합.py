def solution(n, s):
    return [ s//n if i < n - s%n else s//n+1 for i in range(n)] if s//n >= 1 else [-1]
