from collections import deque
def solution(people, limit):
    deq = deque(sorted(people,reverse=True))
    answer = 0
    while deq:
        if deq[0] + deq[len(deq)-1] <=limit and len(deq) > 1:
                deq.popleft()
                deq.pop()
        else:
                deq.popleft()
        answer+=1
    return answer
