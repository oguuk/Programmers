# 3/3
from collections import defaultdict as dft
answer = []
def solution(tickets):
    global tcksLength
    tcksLength = len(tickets)+1
    cities = destination(tickets)
    for icn in range(len(cities["ICN"])):
        city = cities["ICN"].pop()
        flying(city,2,cities,["ICN","%s"%city])
        cities["ICN"].insert(0,city)
    return min(answer)

def destination(tickets):
    cities = dft(list)
    for ticket in tickets:
        cities[ticket[0]].append(ticket[1])
    return cities

#길이가 안됐는데 끊긴다? 다시 고대로 입력해주기
def flying(city,length,cities,route):
    global tcksLength,answer
    if length >= tcksLength:#길이 완성
        answer.append(route)
        return
    else:
        for i in range(len(cities[city])):
            temp = cities[city].pop()
            flying(temp,length+1,cities,route+[temp])
            cities[city].insert(0,temp)

# 3/1 정확성 20점
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
