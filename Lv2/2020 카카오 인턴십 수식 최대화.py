from itertools import permutations as pm
import re
def solution(expression):
    answer = []
    d = re.findall('\d+|\D',expression)
    num_order = [int(d[i]) if i % 2 == 0 else d[i] for i in range(len(d))]
    operands= set(re.findall('\D',expression))
    order = list(pm(operands,len(operands)))
    while order:
        temp = num_order.copy()
        order_ = order.pop()
        for i in order_:
            num = 0
            while num <len(temp):
                if i == temp[num]:
                    if i == '+':
                        temp[num-1:num+2] = [temp[num-1] + temp[num+1]]
                    elif i == '-':
                        temp[num-1:num+2] = [temp[num-1] - temp[num+1]]
                    else:
                        temp[num-1:num+2] = [temp[num-1] * temp[num+1]]
                    num -=1
                    continue
                num +=1
        answer.append(abs(temp[0]))
    return max(answer)
