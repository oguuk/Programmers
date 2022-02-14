def solution(n, wires):
    global map_
    map_ = [[0 for _ in range(n+1)]for _ in range(n+1)]
    for i in wires:
        x,y = i
        map_[x][y] = 1
        map_[y][x] = 1
    return min([abs(dfs(i,j)-dfs(j,i)) for i in range(1,n+1) for j in range(1,n+1) if map_[i][j]])

def dfs(fir,sec):
    global map_
    value = 0
    if fir == sec:
        return
    for i,j in enumerate(map_[fir]):
        if j == 1 and i != sec:
            value +=1+dfs(i,fir)
    return value
