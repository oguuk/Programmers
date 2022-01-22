def solution(n):
    m = n
    answer = ['']
    while n > 0:
        t = str(n%3)
        if t == '0':
            t = '3'
            n -= 1
        answer.append(t)
        n = n // 3
    answer.reverse()
    for i in range(len(answer)):
        if answer[i] == '3':
            answer[i] = '4'
    return ''.join(answer)
