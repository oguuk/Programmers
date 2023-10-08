import sys
import math

n = int(sys.stdin.readline())
arr = map(int, sys.stdin.readline().split())
b, c = map(int, sys.stdin.readline().split())
answer = 0

for a in arr:
    people = a - b
    answer += 1
    if people > 0:
        answer += math.ceil(people / c)
    
print(answer)