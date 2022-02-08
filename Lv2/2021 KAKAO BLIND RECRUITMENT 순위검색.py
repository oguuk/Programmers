map_ = [[[[[]for g in range(3)]for k in range(3)]for j in range(3)]for i in range(3)]

def solution(info, query):
    answer, query2 = [],[]
    info = [[j for j in i.split()]for i in info]
    lists = {0:["cpp", "java", "python"],1:["backend", "frontend"],2:[ "junior", "senior"],3:["chicken", "pizza"]}
    dic = {"cpp":0,"java":1,"python":2,"backend":0,"frontend":1,"junior":0,"senior":1,"chicken":0,"pizza":1}
    
    for i in query:
        temp = [j for j in i.split() if j != 'and']
        l =[]
        for idx,j in enumerate(temp):
            if j == '-':
                l.append(lists[idx])
            else:
                l.append([j])
        query2.append(l)
    
    for i in info:
        splited(i,dic)
    for i in query2:
        answer.append(search(i,dic))
    return answer

def splited(i,dic):
    map_[dic[i[0]]][dic[i[1]]][dic[i[2]]][dic[i[3]]].append(i[4])
     
def search(query,dic):
    answer = 0
    for a in query[0]:
        for b in query[1]:
            for c in query[2]:
                for d in query[3]:
                    for e in map_[dic[a]][dic[b]][dic[c]][dic[d]]:
                        if int(e) >= int(query[4][0]):
                            answer +=1
    return answer
    
#2/8 시도 1 효율성 실팰(시간초과)
map_ = [[[[[]for g in range(3)]for k in range(3)]for j in range(3)]for i in range(4)]

def solution(info, query):
    answer, query2 = [],[]
    info = [[j for j in i.split()]for i in info]
    query = [[j for j in i.split() if j != 'and']for i in query]
    dic = {"-":0,"cpp":1,"java":2,"python":3,"backend":1,"frontend":2,"junior":1,"senior":2,"chicken":1,"pizza":2}
    
    for i in info:
        splited(i,dic)
    for i in query:
        temp =0
        for j in map_[dic[i[0]]][dic[i[1]]][dic[i[2]]][dic[i[3]]]:
            if int(j) >= int(i[4]):
                temp+=1
        answer.append(temp)
    return answer

def splited(info,dic):
    for a in ['-',info[0]]:
        for b in ['-',info[1]]:
            for c in ['-',info[2]]:
                for d in ['-',info[3]]:
                    map_[dic[a]][dic[b]][dic[c]][dic[d]].append(info[4])
#2/8 시도2 효율성 실패(시간초과)
