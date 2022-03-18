import math
def solution(s):
    n = len(s)
    while True:
        if answer:= check(s,n):
            return answer
        n-=1

def check(s,n):
    for start in range(len(s)-n+1):
        a= s[start:start+n//2]
        if n%2:
            isOdd = 1 #
            b= s[start+n-1:start+n//2:-1]
        else:
            isOdd = 0
            b = s[start+n-1:start+(n//2)-1:-1]
        if a == b:
            return len(a)*2+1 if isOdd else len(a)*2
    return False
