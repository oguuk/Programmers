#1개 다른거 쭈루룩 깔아놓고 그 자식노드로 n-1개 씩 다른거로 쭉 찾는다. and연산시 n-1개가 나와야함
def solution(begin, target, words):
    if target not in words:
        return 0
    global tree, end
    end = target
    answer, tree = [], [[]for i in range(len(begin)+1)]
    for i in words:
        num = 0
        for j in range(len(begin)):
            if begin[j] != i[j]:
                num+=1
        tree[num].append(i)
    dfs(0,begin,0,answer)
    return min(answer) if answer else 0

#n+1에서 and연산시 1개만 달라야한다.
def dfs(num,target,level,answer):
    global tree,end
    if target == end:
        answer.append(num)
        return
    if level+1 == len(tree):
        a = 0
        for i in range(len(target)):
            if target[i] != end[i]:
                a +=1
        if a == 1:
            answer.append(num+1)
        return
    for i in tree[level+1]:
        a = 0
        for j in range(len(target)):
            if target[j] != i[j]:
                a +=1
        if a == 1:
            dfs(num+1,i,level+1,answer)
