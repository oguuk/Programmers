import math
def solution(fees, records):
    parking = {}#key차량번호, value입차시간
    time = {i[6:10]:0 for i in records if i[-2:] == "IN"}#key차량번호, vlue누적시간
    for idx,info in enumerate(records):
        values = info.split()
        h,m = values[0].split(':')
        if values[1] in parking.keys():#출차 타임
            time[values[1]] += (int(h)*60+int(m))-parking[values[1]]
            del parking[values[1]]
        else:#주차장에 없는 차량 입차
            parking[values[1]] = 60*int(h)+int(m)
    if len(parking) > 0:#마지막까지 출차가 안된 차들
        for k,v in parking.items():
            time[k] += 1439 - v
                   
    return [fees[1] if time[i]<= fees[0] else fees[1]+math.ceil((time[i]-fees[0])/fees[2])*fees[3] for i,j in sorted(time.items())]
