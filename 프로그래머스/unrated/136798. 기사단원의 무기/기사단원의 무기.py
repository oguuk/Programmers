from collections import Counter as cnt

def divisor_count(num):
    count = 0
    end = int(num**0.5) + 1
    if (num**0.5) % 1 == 0:
        end -= 1
        
    for i in range(1, end):
        if not num%i:
            count += 1
    return count * 2 + 1 if (num**0.5) % 1 == 0 else count * 2

def solution(number, limit, power):
    table = { i:divisor_count(i) for i in range(1, number + 1) }
    weapons = [ table[i] for i in range(1, number + 1)]
    answer = [ k*v if k <= limit else power*v for k, v in cnt(weapons).items()]
    return sum(answer)