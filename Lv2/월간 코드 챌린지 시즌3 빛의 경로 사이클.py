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
        
#2차 시도 reset 없애고 바로 dic으로 찾게 만듦 똑같은 결과 오히려 살짝 시간이 늘어남

#head(방향)를 따지고, 출발지를 따진다.
#1,2,3,4 = 위->아래 아래->위 오른쪽->왼 왼->오
def solution(grid):
    global route
    route, answer = [], []
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            for k in range(1,5):
                a = mirror([k,i,j],grid)
                if a:
                    answer.append(a)
    return sorted(answer)

def mirror(state,grid):
    global route
    answer = 0
    dic = {'S':{1:[1,1,0],2:[2,-1,0],3:[3,0,-1],4:[4,0,1]},
           'R':{1:[3,0,-1],2:[4,0,1],3:[2,-1,0],4:[1,1,0]},
           'L':{1:[4,0,1],2:[3,0,-1],3:[1,1,0],4:[2,-1,0]}}
    while True:
        if state in route:
            return answer if answer else False
        route.append(state.copy())
        state[0], state[1], state[2] = dic[grid[state[1]][state[2]]][state[0]][0], (state[1] + dic[grid[state[1]][state[2]]][state[0]][1]) % len(grid), (state[2] + dic[grid[state[1]][state[2]]][state[0]][2]) % len(grid[0])
        answer +=1
        
#dic[grid[state[1]][state[2]]]#S냐 R이냐 L이냐
#dic[grid[state[1]][state[2]]][state[0]] == info[state[1]][state[2]][state[0]]

#2/15 해결 최종 코드

def solution(grid):
    global route
    route, answer = {}, []
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            for k in range(1,5):
                a = mirror([k,i,j],grid)
                if a:
                    answer.append(a)
    return sorted(answer)

def mirror(state,grid):
    global route
    first, answer = state, 0
    dic = {'S':{1:[1,1,0],2:[2,-1,0],3:[3,0,-1],4:[4,0,1]},
           'R':{1:[3,0,-1],2:[4,0,1],3:[2,-1,0],4:[1,1,0]},
           'L':{1:[4,0,1],2:[3,0,-1],3:[1,1,0],4:[2,-1,0]}}
    while True:
        if 'a'.join(map(str,state)) in route.keys():
            if state == first:
                return answer if answer else False
            return False
        route['a'.join(map(str,state))] = 1
        state[0], state[1], state[2] = dic[grid[state[1]][state[2]]][state[0]][0], (state[1] + dic[grid[state[1]][state[2]]][state[0]][1]) % len(grid), (state[2] + dic[grid[state[1]][state[2]]][state[0]][2]) % len(grid[0])
        answer +=1

'''
경로를 저장하는 자료구조를 list로 하고 해당 방향과 정점이 겹치는게 있는지 확인했는데 시간초과가 나서 해시로 바꿔서 체크함
key값을 [방향,y,x]를 ''.join()으로 합쳐서 키값으로 설정했는데 실패를 했다. 이유는 예를 들어 방향이 3 y가 11 x가 2인 경우와 방향이 3이고 y가 1 x가 12인 경우는 ''.join()으로 따졌을 때 같게 나오기 방향,y,x를 스트링 값으로 합칠 때 구별 표시를 넣어줘야 함으로 'a'.join()으로 바꾸어서 구별하는 식으로 해결함.
'''
