def solution(prices):
    answer = []
    length = len(prices)
    for i in range(length):
        if i == length-1:
            answer.append(0)
            break
        for j in range(i+1,length):
            if prices[j] < prices[i] or j == length-1:
                answer.append(j-i)
                break
            
    return answer
