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