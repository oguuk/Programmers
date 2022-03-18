#1등부터 혹은 꼴등부터
from collections import defaultdict as dd
def solution(n, results):
    winRecord, loseRecord = dd(set), dd(set)
    answer = 0
    visit = [0 for _ in range(n+1)]
    for result in results:
        winRecord[result[0]].add(result[1])
        loseRecord[result[1]].add(result[0])
    for player in range(1,n+1):
        wAnswer, lAnswer = set(), set()
        bfs(wAnswer,player,winRecord,visit.copy())
        bfs(lAnswer,player,loseRecord,visit.copy())
        if len(wAnswer) + len(lAnswer) == n-1:
            answer +=1
    return answer

def bfs(answer,now,record,visit):
    if visit[now] or not record.get(now):
        return
    visit[now] = 1
    for num in record[now]:
        answer.add(num)
        bfs(answer,num,record,visit)
        #.copy()는 공간복잡도에 엄청난 영향을 미치므로 지양하도록
