# 4765. Domino   4765. 多米诺骨牌

n = int(input())

c0 , c1, c2 = 0,0,0
list_c = [c0, c1 ,c2]
nl, nr = 0 , 0

for i in range(n):
    listnum = input().split(" ")
    ordnum = 0
    if(int(listnum[0])%2 != 0 ):
        ordnum += 1
    if(int(listnum[1])%2 != 0 ):
        ordnum += 1
    list_c[ordnum] += 1
    if(ordnum == 1 ):
        if(int(listnum[0])%2!=0):
            nl += 1
        else:
            nr += 1

if (list_c[1]%2 != 0):
    print(-1)
else:
    if (list_c[2]%2 != 0):
        if (nl%2 !=0 ):
            print(0)
        else:
            print(1)
    else:
        if(nl%2 == 0):
            print(0)
        else:
            print(1)