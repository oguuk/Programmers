import copy
def solution(tickets):
    dic = makeRsrc(tickets)
    answer = []
    for i in range(len(dic["ICN"])):
        a = copy.deepcopy(dic)
        dic["ICN"].insert(0,dic["ICN"].pop())
        route = ["ICN",a["ICN"].pop()]
        flag = 1
        while sum(a.values(),[]) != []:
            if a.get(route[-1]) == []:
                flag = 0
                break
            route.append(a[route[-1]].pop())
        if flag:
            answer.append(route)
    answer.sort(key = lambda x:x)
    return answer

def makeRsrc(tick):
    dic = {}
    for i in tick:
        if dic.get(i[0]) == None:
            dic[i[0]] = [i[1]]
        else:
            dic[i[0]].append(i[1])
    return dic
