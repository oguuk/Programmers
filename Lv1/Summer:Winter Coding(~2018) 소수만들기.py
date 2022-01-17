from itertools import combinations

def solution(nums):
    temp = []
    answer = 0
    for i in combinations(nums, 3):
        for j in range(2,i[0]+i[1]+i[2]):
            if (i[0]+i[1]+i[2]) % j == 0:
                break
            if j == (i[0]+i[1]+i[2]) - 1:
                answer +=1

    return answer
