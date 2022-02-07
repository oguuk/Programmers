from itertools import combinations as cmb
def solution(relation):
    answer = 0
    check = []
    num = [i for i in range(len(relation[0]))]
    for i in range(0,len(relation[0])+1):
        combi = cmb(num,i)
        for j in combi:
            lis = []
            for k in range(len(relation)):
                temp = ""
                for g in j:
                    temp+= relation[k][g]
                lis.append(temp)
            if len(set(lis)) == len(relation):
                answer +=1
                check.append(j)
                for g in range(len(check)-1):
                    if set(check[g]).issubset(set(check[len(check)-1])):
                        check.pop()
                        answer -=1
                        break
    return answer
    
#2/7
'''
조합을 통해서 후보키를 찾아나감.
유일성은 issubset으로 판별
'''
