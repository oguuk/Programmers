def solution(numbers):
    if sum(numbers) == 0:
        return '0'
    sorting = [[(str(i)*4)[0:4],i] for i in numbers]
    sorting.sort(reverse=True)
    return ''.join([str(j[1]) for j in sorting])
