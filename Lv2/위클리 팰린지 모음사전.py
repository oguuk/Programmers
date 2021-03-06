def solution(word):
    place_value = [781,156,31,6,1]
    dic = {'A':0,'E':1,'I':2,'O':3,'U':4}
    return sum([dic[j]*place_value[i]+1 for i,j in enumerate(word)])

# 첫 번째 자리는 781 번 바뀌어야 알파벳이 바뀌고, 두 번째 자리는 156 번, 세 번째는 31번, 네 번째는 6번, 마지막은 1번 단위로 알파벳이 바뀐다. 여기서 고려해야할 782는 A가 아니라 E 이다. 따라서 A를 따로 처리해줘야한다. 각 자릿수 마다 알파벳 키의 밸류를 곱하고 1을 더해준다.(1을 더해주지 않으면 100을 맞추려했는데 99만 된 상황과 같다.)
