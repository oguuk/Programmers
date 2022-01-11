def solution(n, left, right):
    count = (left//n)*n
    answer = []
    for i in range(left//n,(right//n)+1):
        for j in range(1,n+1):
            count+=1
            if count >left:
                if j <= i:
                    answer.append(i+1)
                else:
                    answer.append(j)
            if count > right:
                return answer
