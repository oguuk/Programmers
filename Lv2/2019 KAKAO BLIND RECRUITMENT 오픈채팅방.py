def solution(record):
    user = {}
    log = []
    request = []

    for i in range(len(record)):
        request.append(record[i].split())
        if "Enter" in request[i]:
            user[request[i][1]] = request[i][2]
        elif 'Change' in request[i]:
            user[request[i][1]] = request[i][2]


    for i in range(len(record)):
        if 'Enter' in request[i]:
            log.append("%s님이 들어왔습니다."%user[request[i][1]])
        elif 'Leave' in request[i]:
            log.append("%s님이 나갔습니다."%user[request[i][1]])

    return
