# 마지막 버스가 꽉 찼는지 아닌지를 확인한다.(>n*m인 상황에서 앞버스에서 못타서 밀린 경우 혹은 뒤로 쏠려서 마지막 탐임자 -1해도 못타는 현상 가능)
from bisect import bisect_right, bisect_left
def solution(n, t, m, timetable):
    timetable = sorted([int(time.split(":")[0])*60 + int(time.split(':')[1]) for time in timetable])
    timetable = [time for time in timetable if time <= 540+t*(n-1)]

    brValue = bisect_right(timetable,540+t*(n-2 if n != 1 else 0))
    if len(timetable) >=n*m:
        if brValue==(n-1)*m: return ''.join([format((timetable[n*m]-2)//60,'02'),':',format((timetable[n*m]-2)%60,'02')])
        return ''.join([format((max(timetable[:n*m])-1)//60,'02'),':',format((max(timetable[:n*m])-1)%60,'02')])
    else:
        if not timetable[brValue:]:
            seat = {540+t*(bus-1):0 for bus in range(n)}
            seatKeys = sorted(seat.keys())
            for idx,time in enumerate(timetable):
                a = seatKeys[bisect_left(seatKeys,time)]
                if seat[a] < m:
                    seat[a]+=1
                else:
                    if a+t > seatKeys[-1]:
                        return ''.join([format((time-1)//60,'02'),':',format((time-1)%60,'02')])
                    seat[a+t]+=1
            return ''.join([format((540+t*(n-1))//60,'02'),':',format((540+t*(n-1))%60,'02')])
        answer = timetable[brValue:][-1] + (1 if len(timetable[brValue:]) < m else -1 )
        return ''.join([format(answer//60,'02'),':',format(answer%60,'02')])
