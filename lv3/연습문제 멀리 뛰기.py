def solution(n):
    answer = 0
    for two in range(0,n//2+1):
        one = n - (two*2)
        answer += factorial(one+two) // (factorial(one)*factorial(two))
    return answer % 1234567

def factorial(num):
    temp = 1
    for i in range(1,num+1):
        temp*=i
    return temp
