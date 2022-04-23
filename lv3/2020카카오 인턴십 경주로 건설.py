import copy;

dx = [1, -1, 0, 0]  # 오른쪽, 왼쪽, 아래, 위
dy = [0, 0, 1, -1]

def solution(board):
    board1 = copy.deepcopy(board)
    search(0, 0, 0, board, 0)
    search(0, 0, 2, board1, 0)
    return min(board1[-1][-1],board[-1][-1])

def search(y, x, heading, board, cost):
    if x >= len(board) or x < 0 or y >= len(board) or y < 0 or board[y][x] == 1: return
    if (x == len(board)-1 and y == len(board)-1):
        if board[y][x] == 0 or board[y][x] > cost:
            board[y][x] = cost
        return
    if board[y][x] != 0 and board[y][x] < cost: return
    if board[y][x] == 0 or board[y][x] > cost: board[y][x] = cost

    for idx in range(4):
        if idx < 2:
            if heading < 2: search(y + dy[idx], x + dx[idx], idx, board, cost + 100)
            else: search(y + dy[idx], x + dx[idx], idx, board, cost + 600)
        else:
            if heading < 2: search(y + dy[idx], x + dx[idx], idx, board, cost + 600)
            else: search(y + dy[idx], x + dx[idx], idx, board, cost + 100)
