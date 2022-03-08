def solution(n, costs):
    costs.sort(key = lambda x:x[2])
    cycleTable = set([costs[0][0]])
    answer = 0
    while len(cycleTable) != n:
        for edge in costs:
            if edge[0] in cycleTable and edge[1] in cycleTable:
                continue
            if edge[0] in cycleTable or edge[1] in cycleTable:
                cycleTable.update([edge[0],edge[1]])
                answer += edge[2]
                break
    return answer
