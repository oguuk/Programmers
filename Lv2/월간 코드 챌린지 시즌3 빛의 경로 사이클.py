#2/15 1차 시도 Test Case 6개 패스하고 나머지 시간 초과 for문을 너무 많이 씀

#head(방향)를 따지고, 출발지를 따진다.
#1,2,3,4 = 위->아래 아래->위 오른쪽->왼 왼->오
def solution(grid):
    global info,route
    route, answer = [], []
    info = reset(grid)
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            for k in range(1,5):
                a = mirror([k,i,j])
                if a:
                    answer.append(a)
    return sorted(answer)

def reset(grid):
    info = [[] for _ in range(len(grid))]
    for i,v in enumerate(grid):
        for j in v:
            if j == 'S':#직진
                info[i].append({1:[1,1,0],2:[2,-1,0],3:[3,0,-1],4:[4,0,1]})
            elif j == 'R':#오른쪽
                info[i].append({1:[3,0,-1],2:[4,0,1],3:[2,-1,0],4:[1,1,0]})
            else:#왼쪽
                info[i].append({1:[4,0,1],2:[3,0,-1],3:[1,1,0],4:[2,-1,0]})
    return info

def mirror(state):
    global info,route
    answer = 0
    while True:
        if state in route:
            return answer if answer else False
        route.append(state.copy())
        state[0], state[1], state[2] = info[state[1]][state[2]][state[0]][0], (state[1] + info[state[1]][state[2]][state[0]][1]) % len(info), (state[2] + info[state[1]][state[2]][state[0]][2]) % len(info[0])
        answer +=1
        
#
