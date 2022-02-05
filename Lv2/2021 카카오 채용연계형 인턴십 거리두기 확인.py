#1. 맨해튼거리 (abs(r1-r2)+abs(c1-c2)) > 2이냐? yes -> 방역 ok
#2. 아니라면 파티션으로 막혀있냐? no -> 방역x yes-> 방역o
#사람 위치는 서로 직선이냐 대각선이냐로 나뉨
def solution(places):
    global place
    place = places
    num, answer = 0, []
    while num < 5:
        flag = 0
        people = [(i,j) for i in range(5) for j in range(5) if places[num][i][j] == 'P']
        if not people or len(people) == 1:
            answer.append(1)
            num+=1
            continue

        for i in range(len(people)-1):
            for j in range(i+1,len(people)):
                if not socialDistance(num,people[i],people[j]):#거리두기 안지킨 경우
                    flag = 1
                    break
            if flag:
                break
        if flag:
            answer.append(0)
        else:
            answer.append(1)
        num +=1
    return answer

def socialDistance(num,first,second):
    global place
    r1,c1 = first
    r2,c2 = second
    manhat = abs(r1-r2) + abs(c1-c2)
    if manhat > 2:
        return True

    else:#먼저 직선이냐 대각선이냐로 분류
        if r1-r2 == 0 or c1-c2 == 0:#직선
            if c1-c2 == 0:#세로
                for i in range(r1,r2):
                    if place[num][i][c1] == 'X':
                        return True
            else:#가로
                for i in range(c1,c2):
                    if place[num][r1][i] == 'X':
                        return True
        else:#대각선
            if c1 < c2:
                if place[num][r1][c1+1] == 'X' and place[num][r2][c2-1] == 'X':
                    return True
            else:
                if place[num][r1][c1-1] == 'X' and place[num][r2][c2+1] == 'X':
                    return True
        return False
