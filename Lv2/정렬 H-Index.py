def solution(citations):
    if sum(citations) == 0:
        return 0
    sort_cita = sorted(citations)
    for i in range(len(sort_cita)):
        if sort_cita[i] >= len(sort_cita)-i:
            return len(sort_cita)-i
