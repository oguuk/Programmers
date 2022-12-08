import heapq as hq
def solution(n, k, enemy):
    answer = 0
    enemy_rank = []
    
    for e in enemy:
        hq.heappush(enemy_rank, -e)
        if n >= e:
            answer += 1
            n -= e
        else:
            if k > 0: 
                k -= 1
                big = -hq.heappop(enemy_rank)
                if big >= e:
                    n += (big - e)
                answer += 1
            else: 
                break
    return answer