def solution(num):
    return len([i if num % i is 0 for i in range(1,num+1,2) ])
