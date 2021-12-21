import math

def solution(brown, yellow):
    answer = []
    new_brown = brown - 4
    msqrt = int(math.sqrt(yellow))
    if yellow == 1:
        return [3, 3]
    for j in range(msqrt,0,-1):
        if j == 1:
            return [yellow + 2,3]
        if yellow % j == 0:
            if new_brown == j*4:
                answer = [j + 2, j + 2]
                break 
            if new_brown == (yellow // j) * 2 + j * 2:
                answer = [(yellow // j) + 2, j + 2]
                break


    return answer
