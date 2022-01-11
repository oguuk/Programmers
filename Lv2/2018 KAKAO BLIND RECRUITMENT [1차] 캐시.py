def solution(cacheSize, cities):
    time = 0
    cities = [i.lower() for i in cities]
    cache = []
    for i in cities:
        if i not in cache:
            if cacheSize:
                if len(cache) == cacheSize:
                    cache.pop()
                cache.insert(0,i)
            time += 5
        else:
            cache.remove(i)
            cache.insert(0,i)
            time += 1
    return time
