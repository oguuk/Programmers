def solution(participant, completion):
    answer = 0
    participant.sort()
    completion.sort()
    for i in range(0, len(participant)-1):
        if participant[i] != completion[i]:
            answer = participant[i]
            return answer
        else:
            continue
    answer = participant[len(participant)-1]
    return answer
