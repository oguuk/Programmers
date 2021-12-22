from itertools import product

def solution(numbers, target):
    answer = count = 0
    list1 = [1,0]
    prd = list(product(list1,repeat=len(numbers)))

    while True:
        sum = 0

        for i in range(len(numbers)):
            if prd[count][i]:
                sum += numbers[i]
            else:
                sum -= numbers[i]

        if sum == target:
            answer +=1
        if count == len(prd)-1:
            break
        count +=1

    return answer
