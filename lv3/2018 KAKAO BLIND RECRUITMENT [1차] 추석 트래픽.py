answer = 1
def solution(lines):
    calculate(lines)
    for idx in range(len(lines) - 1):
        check(lines[idx][0],lines[idx+1:])
    return answer

def calculate(lines):
    for idx, time in enumerate(lines):
        time = time.split()[1:]
        clock = time[0].split(":")
        end = round(int(clock[0]) * 3600 + int(clock[1]) * 60 + float(clock[2]), 3)
        lines[idx] = [end, end - float(time[1][:-1])]
    lines.sort(key=lambda x: x[0])

def check(end, lines):
    global answer
    temp = 1
    for start in lines:
        if end + 0.999 <= start[1]:
            continue
        temp += 1
    if temp > answer:
        answer = temp
