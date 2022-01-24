def solution(board):
    answer = 0
    something = sum([i for i in board[0]])
    for i in range(1,len(board)):
        for j in range(1,len(board[0])):
            if board[i][j]:
                board[i][j] += min(board[i-1][j],board[i-1][j-1],board[i][j-1])
            if answer < board[i][j]:
                answer = board[i][j]
    return 1 if answer == 0 and something != 0 else answer**2

# DP로 해결
# 4개의 사격형으로 오른쪽 밑 자리를 기준으로 1이면 왼쪽, 위쪽, 왼쪽위 중에서 최솟값을 본인 값에 더해간다.
# 그 중 최댓값을 answer에 저장하여 제곱을 하여 리턴한다.
# 이중리스트의 0번째 행은 범위를 벗어나므로 코드를 깔끔하게 처리하기 위해 sum메소드를 사용하여 그 값을 something에
# 더하여 모든 자리가 0인 경우와 1이 1개라도 있는 경우를 구별한다.
