#(누적시간 + 해당 소요시간)-시작시간
import heapq as hq
answer = []
def solution(jobs):
    map_ = info(jobs)
    return arrange(map_,0)
    return answer

def info(jobs):
    map_ = {i:[]for i in range(max(jobs,key = lambda x:x[0])[0]+1)}
    for i in jobs:
        hq.heappush(map_[i[0]],[i[1],i[0]])
    return map_

def arrange(map_,num):#num은 계속 누적이 되어야
    
    a,b = min(map_[:num+1],key = lambda x:x != [])[0]#a가 소요시간,b 시작시간
    answer.append((num+a)-b)
    num += a
    return arrange(map_,num)


#2/28

#(누적시간 + 해당 소요시간)-시작시간
import heapq as hq
answer = []
def solution(jobs):
    map_ = info(jobs)
    #jobs.sort(key = lambda x:(-x[0],-x[1]))
    return sum(calculate(map_,[],0)) // len(jobs)

def info(jobs):
    map_ = {i:[]for i in [j[0] for j in jobs]}
    for i in jobs:
        hq.heappush(map_[i[0]],i[1])
    return map_

# def calculate(jobs,answer):#num은 계속 누적이 되어야
#     if not jobs:
#         return answer
#     start,howLong = jobs.pop()
#     answer.append((answer[-1]+howLong)-start)
#     return calculate(jobs,answer)

def calculate(jobs,answer,time):
    if sum(jobs.values(),[]) == []:
         return answer
    start = min(jobs,key = lambda x:int(x) <=time and len(jobs[x]) > 0 and jobs[x][0])
    howLong = jobs[start].pop()
    answer.append(time + howLong - start)
    time += howLong
    return calculate(jobs,answer,time)
