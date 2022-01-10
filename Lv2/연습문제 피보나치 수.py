def solution(n):
    count = 0
    fibo = [1,1]
    while count != n-2:
        fibo.append(fibo[count]+fibo[count+1])
        count +=1
    return fibo[n-1] % 1234567
