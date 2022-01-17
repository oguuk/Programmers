import collections as cs
from itertools import combinations as cmb
def solution(orders, course):
    new_orders = []
    findMaxString = [[]]
    num = 0
    for i in orders:
        for j in course:
            if j <= len(i):
                new_orders.append(cmb(i,j))#순열은 중복이 나오니 조합으로
    temp = [''.join(sorted(j)) for i in new_orders for j in i]#정렬을 통해 통일시킴
    temp = sorted(list(cs.Counter(temp).items()),key = lambda x:len(x[0]))
    maxx,string_len = temp[0][1],len(temp[0][0])
    for i in range(len(temp)):
        if len(temp[i][0]) != string_len:
            string_len = len(temp[i][0])
            num +=1
            if temp[i][1] > 1:
                findMaxString.append([temp[i][0]])
                maxx = temp[i][1]
            else:
                findMaxString.append([])
                maxx = 2
        else:
            if temp[i][1] > maxx:
                maxx = temp[i][1]
                findMaxString[num] = [temp[i][0]]
            elif temp[i][1] == maxx:
                findMaxString[num].append(temp[i][0])
    return sorted([j for i in findMaxString for j in i])
