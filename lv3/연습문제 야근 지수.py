import heapq as hq
def solution(n, works):
    hq.heapify(works := [-work for work in works])
    while n>0:
        if works[0] == 0:
            break
        n-=1
        hq.heappush(works,hq.heappop(works)+1)
    return sum([i**2 for i in works])
