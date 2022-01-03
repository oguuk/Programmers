from itertools import combinations as cmb

def solution(numbers):
    answer = sorted(list(set(i+j for i,j in cmb(numbers,2))))
    return answer
