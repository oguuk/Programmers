#abs(x1-x2),abs(y1-y2) != 1 그리고 col이 겹치면 안됨
def solution(n):
    global size, answer
    answer = 0
    size = n
    for i in range(n):
        check = [0 for j in range(n)]
        dfs([0,i],[],check)
    return answer

def dfs(location,stack,check):
    global size
    global answer
    if location[0] == size-1:#범위까지 다 찾음
        answer+=1
        return
    check[location[1]] = 1
    stack.append(location.copy())
    for col in range(size):
        if not check[col]:#col이 안겹치는지
            flag = 1
            for stk in stack:
                if abs(stk[0]-(location[0]+1)) == abs(stk[1]-col):
                    flag = 0
                    break
            if flag:
                dfs([location[0]+1,col],stack.copy(),check.copy())
