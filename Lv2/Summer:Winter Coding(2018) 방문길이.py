#1좌표평면을 넘어갔나?
#2 중복된 자리인가?(path로 저장된 벡터)
def solution(dirs):
    go = [[],[]]
    path = []#[전x전y후x후y]
    location = [5,5]
    for i in dirs:
        if i == "U":#위
            if location[1] + 1 > 10:
                continue
            location[1] += 1
            go[0] = [location[0],location[1]-1,location[0],location[1]]
            go[1] = [location[0],location[1],location[0],location[1]-1]
        elif i == "D":#아래
            if location[1] - 1 < 0:
                continue
            location[1] -= 1
            go[0] = [location[0],location[1]+1,location[0],location[1]]
            go[1] = [location[0],location[1],location[0],location[1]+1]
        elif i == "L":#왼쪽
            if location[0] - 1 < 0:
                continue
            location[0] -= 1
            go[0] = [location[0]+1,location[1],location[0],location[1]]
            go[1] = [location[0],location[1],location[0]+1,location[1]]
        else:#오른쪽
            if location[0] + 1 > 10:
                continue
            location[0] += 1
            go[0] = [location[0]-1,location[1],location[0],location[1]]
            go[1] = [location[0],location[1],location[0]-1,location[1]]
        if  go[0] not in path or go[1] not in path:
            path.append(go[0])
            path.append(go[1])
    return len(path)//2
