from itertools import permutations as pm

def solution(numbers):
    ansList = []
    permu = []
    s = []
    answer = 0
    for i in range(len(numbers)-1, 0, -1):
        ansList.append(str(int(int(numbers) // (10 ** i))))
        numbers = numbers[len(numbers) - i:len(numbers)]
        if i == 1:
            ansList.append(numbers)

    for n in range(1,len(ansList)+1):
        permu += list(pm(ansList, n))
    for m in range(len(permu)):
        s.append(int("".join(permu[m])))
    s = set(s)
    for j in s:
        count = 0
        if j == 1 or j == 0:
            continue
        for g in range(2,j):
            if j % g == 0:
                count += 1
            if count > 0:
                break
        if count == 0:
            answer +=1
    
    return answer
