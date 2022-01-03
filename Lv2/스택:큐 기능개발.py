import math
def solution(progresses, speeds):
    answer = []
    cut = 1
    list = [math.ceil((100-progresses[i])/speeds[i]) for i in range(len(speeds))]
    day = list[0]
    for i in range(1,len(list)):
        if day >= list[i]:
            cut += 1
        else:
            answer.append(cut)
            cut = 1
            day = list[i]
        if i == len(list)-1:
            answer.append(cut)
        
    return answer
