import sys

N = int(sys.stdin.readline())
board = [list(map(int,sys.stdin.readline().split(' '))) for _ in range(N)]
origin_sand = sum(sum(sublist) for sublist in board)

spread = [
    [[-1, 1, 0.01], [1, 1, 0.01], [-1, 0, 0.07], [1, 0, 0.07], [-2, 0, 0.02], [2, 0, 0.02], [-1, -1, 0.1], [1, -1, 0.1], [0, -2, 0.05], [0, -1, 1]],
    [[-1, -1, 0.01], [-1, 1, 0.01], [0, -1, 0.07], [0, 1, 0.07], [0, -2, 0.02], [0, 2, 0.02], [1, -1, 0.1], [1, 1, 0.1], [2, 0, 0.05], [1, 0, 1]],
    [[-1, -1, 0.01], [1, -1, 0.01], [-1, 0, 0.07], [1, 0, 0.07], [-2, 0, 0.02], [2, 0, 0.02], [-1, 1, 0.1], [1, 1, 0.1], [0, 2, 0.05], [0, 1, 1]],
    [[1, 1, 0.01], [1, -1, 0.01], [0, -1, 0.07], [0, 1, 0.07], [0, -2, 0.02], [0, 2, 0.02], [-1, -1, 0.1], [-1, 1, 0.1], [-2, 0, 0.05], [-1, 0, 1]]
]
spread_EOI = 10
directions = [[0, -1], [1, 0], [0, 2], [-2, 0]]
cur = [N//2, N//2]

for i in range(N//2 + 1):
    for d in range(4): # 0 왼 1 아 2 오 3 위
        if cur == [0, -1]: break
            
        dr = directions[d]

        for r in range(abs(dr[0])):
            if dr[0] > 0: cur = [cur[0] + 1, cur[1]]
            else: cur = [cur[0] - 1, cur[1]]
            if board[cur[0]][cur[1]] > 0:
                remove = 0
                for j in range(spread_EOI):
                    s = spread[d][j]
                    new_r = cur[0] + s[0]
                    new_c = cur[1] + s[1]
                    go_sand = int(board[cur[0]][cur[1]] * s[2])

                    if 0 <= new_r < N and 0 <= new_c < N:
                        if j == spread_EOI - 1:
                            board[new_r][new_c] += (board[cur[0]][cur[1]] - remove)
                        else:
                            board[new_r][new_c] += go_sand
                    remove += go_sand
            board[cur[0]][cur[1]] = 0
            
        for c in range(abs(dr[1])):
            if dr[1] > 0: cur = [cur[0], cur[1] + 1]
            else: cur = [cur[0], cur[1] - 1]
            if cur == [0, -1]: break
            if board[cur[0]][cur[1]] > 0:
                remove = 0
                for j in range(spread_EOI):
                    s = spread[d][j]
                    new_r = cur[0] + s[0]
                    new_c = cur[1] + s[1]
                    go_sand = int(board[cur[0]][cur[1]] * s[2])
                    if 0 <= new_r < N and 0 <= new_c < N:
                        if j == spread_EOI - 1:
                            board[new_r][new_c] += (board[cur[0]][cur[1]] - remove)
                        else:
                            board[new_r][new_c] += go_sand
                    remove += go_sand
            board[cur[0]][cur[1]] = 0
            
        if dr[0] != 0:
            directions[d][0] = -(abs(dr[0]) + 2) if dr[0] < 0 else dr[0] + 2
        elif dr[1] != 0:
            directions[d][1] = -(abs(dr[1]) + 2) if dr[1] < 0 else dr[1] + 2
            
print(origin_sand - sum(sum(sublist) for sublist in board))