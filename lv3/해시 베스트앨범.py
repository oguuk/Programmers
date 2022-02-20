#1.장르(총합 비교 그리고 같은 장르 안에서 재생횟수 따짐)순 2. 같으면 (인덱스 오름차순)
def solution(genres, plays):
    first, answer = {}, []
    for i,j in enumerate(zip(genres,plays)):
        if first.get(j[0]) is None:
            first[j[0]] = [j[1]]
            first[j[0]].append([j[1],i])
        else:
            first[j[0]][0] += j[1]
            first[j[0]].append([j[1],i])
    first = sorted(list(first.values()),key = lambda x:x[0],reverse = True)
    for i in range(len(first)):
        first[i] = sorted(first[i][1:],key = lambda x:(x[0],-x[1]),reverse = True)
        answer.append(first[i][0][1])
        if len(first[i]) > 1:
            answer.append(first[i][1][1])
    return answer
