def solution(s):
    time = 0
    zeros = 0
    while True:
        if s == '1':
            return [time,zeros]
        time +=1
        zeros += s.count('0')
        temp = s.count('0')
        s = format(len(s) - temp,'b')
