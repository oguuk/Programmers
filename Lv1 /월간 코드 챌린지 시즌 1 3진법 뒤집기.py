def solution(n):
    count = 0
    answer = 0
    ternary = ""
    while True:
        if n // 3**count > 0:
            count += 1
            continue
        for i in range(count-1,-1,-1):
            if n // 3**i > 0:
                ternary += str(n//3**i)
                n -= (n//3**i)*3**i
            else:
                ternary += "0"
        for j in range(count):
            if int(ternary[j]) > 0:
                answer += int(ternary[j])*3**j
        break
        
    return answer
