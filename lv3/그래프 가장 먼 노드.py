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


#3/4

from collections import deque, Counter

def solution(n, edge):
    answer = 0
    graph = {}
    for i in edge:
        if i[0] in graph:
            graph[i[0]].append(i[1])
        else:
            graph[i[0]] = [i[1]]
        if i[1] in graph:
            graph[i[1]].append(i[0])
        else:
            graph[i[1]] = [i[0]]
    
    result = bfs(graph,1)
    result = sorted(result.values(), reverse=True)
    return list(Counter(result).values())[0]

def bfs(edge,root):
    visited = {}
    queue=deque([[root,0]])
    arr = [[root,0]]
    while queue:
        current = queue.popleft()
        if current[0] not in visited:
            visited[current[0]] = current[1]
            add = set(edge[current[0]]) - set(visited)
            queue += ([[i,current[1]+1] for i in add])
    return visited

# 3/5
import sys; sys.setrecursionlimit(999999)
def solution(n, edge):
    
    global ways,fee
    ways = {i:[] for i in range(1,n+1)}
    fee = [10e10 if i > 1 else 0 for i in range(n+1)]

    for i,j in edge:
        ways[i].append(j)
        ways[j].append(i)

    for i in ways[1]:
        dfs(i,0)
        
    return fee.count(max(fee))

def dfs(vertex,cost):
    global ways,fee
    if fee[vertex] <= cost:
        return
    fee[vertex] = cost
    for i in ways[vertex]:
        if fee[i] > cost+1:
            dfs(i,cost+1)
