def solution(n, money):
    global table
    table = [0 if change != 0 else 1 for change in range(n+1)]
    for coin in money:
        dp(coin)
    return table[-1]

def dp(coin):
    global table
    for change in range(1,len(table)):
        if change - coin >= 0:
            table[change] += table[change-coin]
