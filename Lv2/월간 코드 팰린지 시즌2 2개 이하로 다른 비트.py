def solution(numbers):
    answer = []
    for i in numbers:
        up = 1
        while True:
            count = 0
            if i % 2 ==0:
                answer.append(i+1)
                break
            else:
                count = 0
                bi = bin(i)
                for j in range(len(bi)):
                    if bi[-(j+1)] != '1':
                        break
                    count +=1
                answer.append(i+2**(count-1))
                break
    return answer
