from collections import deque
def solution(s):
    answer = 0
    between = 0
    deq = deque([k for k in s])
    for j in range(len(deq)):
        bracket = [0,0,0]
        deq.rotate(-1)
        for i in range(len(deq)):
            if deq[i] == ")":
                if bracket[0] <= 0:
                        break
                if deq[i-1] == "{" or deq[i-1] == "[":
                    break
                bracket[0] -=1
            elif deq[i] == "}":
                if bracket[1] <= 0:
                    break
                if deq[i-1] == "(" or deq[i-1] == "[":
                    break
                bracket[1] -=1
            elif deq[i] == "]":
                if bracket[2] <= 0:
                    break
                if deq[i-1] == "{" or deq[i-1] == "(":
                    break
                bracket[2] -=1
            else:
                if deq[i] == "(":
                    bracket[0] +=1
                elif deq[i] == "{":
                    bracket[1] +=1
                elif deq[i] == "[":
                    bracket[2] +=1
            if i == len(deq)-1 and sum(bracket) == 0:
                answer +=1
    return answer
