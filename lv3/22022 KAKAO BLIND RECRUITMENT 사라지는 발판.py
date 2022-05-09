import sys;sys.setrecursionlimit(10000)
dx = [1,-1,0,0]# 오른쪽, 왼쪽, 위, 아래
dy = [0,0,1,-1]
result = 25

def solution(board, aloc, bloc):
    global x,y
    x,y = len(board[0]),len(board)
    Move(board,aloc,bloc,1,0)
    return 1

def Move(board,player_a,player_b,flag,playtime):
    global x,y
    if flag:#A턴
        for idx in range(4):
            if not ((player_a[0] + dy[idx] >= y) or (player_a[0] + dy[idx] < 0) or (player_a[1] + dx[idx] >= x) or (player_a[1] + dx[idx] < 0)):
                ny, nx = player_a[0] + dy[idx], player_a[1] + dx[idx]
                if board[ny][nx]:
                    board_copy = board[:]
                    board_copy[player_a[1]][player_a[0]] = 0
                    Move(board_copy,[ny,nx],player_b,0,playtime+1)
    else:#B턴
        for idx in range(4):
            if not ((player_b[0] + dy[idx] >= y) or (player_b[0] + dy[idx] < 0) or (player_b[1] + dx[idx] >= x) or (player_b[1] + dx[idx] < 0)):
                ny, nx = player_b[0] + dy[idx], player_b[1] + dx[idx]
                if board[ny][nx]:
                    board_copy = board[:]
                    board_copy[player_b[1]][player_b[0]] = 0
                    Move(board_copy,player_a,[ny,nx],1,playtime+1)
