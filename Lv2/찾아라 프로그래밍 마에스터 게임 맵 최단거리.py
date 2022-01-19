//dfs
from collections import deque
dy = [-1,1,0,0]#상,하,좌,우
dx = [0,0,-1,1]
def solution(maps):
    global global_maps
    global_maps = maps
    global n,m
    n,m = len(maps[0])-1,len(maps)-1#n=x,m=y
    return dfs(0,0) if dfs(0,0) != 1 else -1

def dfs(x,y):
    global global_maps
    global n,m
    que = deque()
    que.append((y,x))
    while que:
        y,x = que.popleft()
        for i in range(4):
            ny = y + dy[i]
            nx = x + dx[i]
            if nx > n or ny < 0 or ny > m or nx < 0:
                continue
            if global_maps[ny][nx]==1:
                global_maps[ny][nx] = global_maps[y][x] + 1
                que.append((ny,nx))
    return global_maps[m][n]
    
