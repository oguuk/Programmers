import sys; sys.setrecursionlimit(10000)
def solution(n, edge):
    global ways,fee
    ways = [[] for _ in range(n+1)]
    fee = [10e10]*(n+1)
    for i,j in edge:
        ways[i].append((j,1))
        ways[j].append((i,1))
    for i in ways[1]:
        dfs(i,0)
    return fee[2:].count(max(fee[2:]))

def dfs(vertex,cost):
    global ways,fee
    if vertex[0] == 1:
        return
    if fee[vertex[0]] > cost+1:
        fee[vertex[0]] = cost+1
    else:
        return
    for i in ways[vertex[0]]:
        if fee[i[0]] < cost+1:
            continue
        dfs(i,cost+1)
