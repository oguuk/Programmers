from collections import defaultdict as dd

def solution(enroll, referral, seller, amount):
    parentOrga = dd(str)
    income = {name:0 for name in enroll}
    
    for person, parent in zip(enroll, referral):
        parentOrga[person] = parent
    for who, howmany in zip(seller,amount):
        discount = howmany*10
        income[who] +=howmany*90
        distributing(who,discount, parentOrga, income)
    return [income[name] for name in enroll]

def distributing(name, profit, parentOrga, income):
    if parentOrga[name] == '-':
        return
    discount = int(profit*0.1)
    income[parentOrga[name]] += profit-discount
    if profit < 10:
        return
    distributing(parentOrga[name], discount, parentOrga, income)
