def solution(routes):
    routes.sort(key = lambda x:(x[1],x[0]))
    maxi = routes[0][1]
    camera = 1
    for car in routes:
        if car[0] > maxi:
            maxi = car[1]
            camera += 1
    return camera
