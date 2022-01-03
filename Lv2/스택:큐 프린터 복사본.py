from collections import deque
def solution(priorities, location):
    queue = deque(priorities)
    answer = 0
    while True:
        max_ = max(queue)
        if queue[0] == max_:
            if 0 == location:
                return answer + 1
            else:
                queue.popleft()
                location -= 1
                answer +=1
        else:
            location = (len(queue) + location) - queue.index(max_) if  location < queue.index(max_) else location - queue.index(max_)
            queue.rotate(-(queue.index(max_)))
