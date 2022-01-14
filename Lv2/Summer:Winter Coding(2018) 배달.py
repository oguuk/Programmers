def solution(N, road, K):
    maps = [[[] for i in range(N)] for j in range(N)]
    short = [500001 for i in range(N)]
    for i in road:
        if i[0] > i[1]:
            maps[i[1]-1][i[0]-1].append(i[2])
            continue
        maps[i[0]-1][i[1]-1].append(i[2])
    search(maps,0,short,0,K)
    return len([i for i in short if i != 500001])+1

def search(maps,idx,short,sum_,K):
    if sum_ >= K:
        return
    for i in range(len(short)):
        if maps[idx][i]:
            for j in maps[idx][i]:
                if sum_ + j <= K and sum_ + j < short[i]:
                    short[i] = sum_ + j
                    search(maps,i,short,j+sum_,K)
