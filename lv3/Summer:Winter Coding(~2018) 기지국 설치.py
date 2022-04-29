from collections import deque
import math
def solution(n, stations, w):
    stations = deque(stations)
    answer = 0
    cur = 0
    RANGE = w*2+1
    while True:
        station = stations.popleft()
        answer += math.ceil((station-w-cur-1)/RANGE)
        cur = station+w
        if not stations:
            answer += math.ceil((n-cur)/RANGE)
            break
    return answer
