def solution(N, road, K):
    maps = [[[] for i in range(N)] for j in range(N)]
    short = [500001 for i in range(N)]
    for i in road:
        if i[0] > i[1]:
            maps[i[1]-1][i[0]-1].append(i[2])
            continue
        maps[i[0]-1][i[1]-1].append(i[2])
    search(maps,0,short,0,K)
    return len([i for i in short if i != 500001])+1

def search(maps,idx,short,sum_,K):
    if sum_ >= K:
        return
    for i in range(len(short)):
        if maps[idx][i]:
            for j in maps[idx][i]:
                if sum_ + j <= K and sum_ + j < short[i]:
                    short[i] = sum_ + j
                    search(maps,i,short,j+sum_,K)
                    
//수정후
def solution(N, road, K):
    global road_map,k,n,least_fee,start
    start = [0 for _ in range(N)]
    least_fee = [6e+5 for _ in range(N)]
    road_map = [[[] for _ in range(N)]for _ in range(N)]
    k = K
    n = N
    for i in road:
        road_map[i[1]-1][i[0]-1].append(i[2])
        road_map[i[0]-1][i[1]-1].append(i[2])
    bfs(0,0)
    least_fee[0] = 0
    return sum([1 for i in least_fee if i <= k])

def bfs(num,fee):
    global road_map,k,n,least_fee,start
    if fee >= k:
        return
    for i in range(n):
        if road_map[num][i]:
            minimum = fee + min(road_map[num][i])
            if least_fee[i] > minimum:
                least_fee[i] = minimum
                bfs(i,minimum)
