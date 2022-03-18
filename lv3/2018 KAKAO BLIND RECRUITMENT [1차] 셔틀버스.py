from bisect import bisect_right as br
def solution(n, t, m, timetable):
    timetable = [int(time.split(":")[0])*60 + int(time.split(':')[1]) for time in timetable]
    timetable = sorted([time for time in timetable if time <= 540+t*(n-1)])

    if len(timetable) >=n*m: return ''.join([format((max(timetable[:n*m])-1)//60,'02'),':',format((max(timetable[:n*m])-1)%60,'02')])
    else:
        # 마지막 버스가 꽉 찼는지 아닌지를 확인한다.(앞버스에서 못타서 밀린 경우 혹은 뒤로 쏠림현상 가능)
        brValue = br(timetable,540+t*(n-2 if n != 1 else n-1))
        if brValue > (n-1)*m or not timetable[brValue:]:#타야하는 버스시간들이 밀린 상황이고 막차 좌석에 여유가 있음
            return ''.join([format((540+t*(n-1))//60,'02'),':',format((540+t*(n-1))%60,'02')])
        answer = timetable[brValue:][-1] + (1 if len(timetable[brValue:]) < m else -1 )
        return ''.join([format(answer//60,'02'),':',format(answer%60,'02')])

# from bisect import bisect_left as bl
# def solution(n, t, m, timetable):
#     timetable = [int(time.split(":")[0])*60 + int(time.split(':')[1]) for time in timetable]
#     timetable = [cut for cut in timetable if cut <= 540+t*(n-1)]
#     bus = {540+(t*shuttle):[] for shuttle in range(n)}
#     busTime = sorted(list(bus.keys()))
#     timetable.sort()
#     for crew in timetable:
#         blValue = bl(busTime,crew)
#         if blValue == len(busTime):
#             continue
#         if len(bus[busTime[blValue]]) == m:
#             temp =1
#             while blValue+temp <len(busTime):
#                 if bus[busTime[blValue+temp]] != m:
#                     bus[busTime[blValue+temp]].append(crew)
#                     break
#                 temp+=1
#             continue
#         bus[busTime[blValue]].append(crew)
#     if not bus[busTime[-1]]:#한명도 없으면
#         return ''.join([format(busTime[-1]//60,'02'),':',format(busTime[-1]%60,'02')])
#     bus[busTime[-1]].sort()
#     if len(bus[busTime[-1]]) == m:#꽉 찼으면
#         bus[busTime[-1]][-1] -=1
#         return ''.join([format(bus[busTime[-1]][-1]//60,'02'),':',format(bus[busTime[-1]][-1]%60,'02')])
#     else:#자리가 남으면
#         return ''.join([format(busTime[-1]//60,'02'),':',format(busTime[-1]%60,'02')])
