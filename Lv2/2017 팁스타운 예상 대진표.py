#A와B가 대진표에서 얼마나 떨어져있는가?
import math
def solution(n,a,b):
    if a > n//2 and b > n//2:
        return solution(n/2,a-n/2,b-n/2)
    if a <= n//2 and b <= n//2:
        return solution(n/2,a,b)
    return int(math.log2(n))
