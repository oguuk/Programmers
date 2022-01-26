def solution(n, k):
    n = [int(i) for i in convert(n,k).split('0') if i.isdigit()]
    return sum([1 for j in n if isprime(j)])

def convert(num,k):
    string = ""
    while num > 0:
        string += str(num%k)
        num = num//k
    return string[::-1] if string else '0'

def isprime(num):
    if num <= 1 or not num:
        return False
    for i in range(2,int(num**0.5)+1):
        if num % i == 0:
            return False
    return True
