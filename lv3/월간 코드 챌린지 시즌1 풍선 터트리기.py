def solution(a):
    answer = 0
    left, right = 0, a.index(min(a))
    for idx in range(0,right):
        if a[idx] <= a[left]:
            left = idx
            answer+=1
    left = len(a)-1
    for idx in range(len(a)-1,right-1,-1):
        if a[idx] <= a[left]:
            left = idx
            answer+=1
    return answer
