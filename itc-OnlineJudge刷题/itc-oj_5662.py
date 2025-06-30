# 5662. Lucky Sum of Digits
# m*4+n*7 == c
c = int(input())

ln = []

for m in range(0,250000):
    if(m*4>c):
        break
    if((c-m*4)%7 == 0):
        n = (c-m*4)//7
        ln.append([int(m),int(n)])

# print(ln)

def find_shorst(ln):
    list_sum = []
    lenth = ln[0][0]+ln[0][1]
    for i in range(len(ln)):
        if(ln[i][0]+ln[i][1]<lenth):
            list_sum = []
        if(ln[i][0]+ln[i][1] == lenth ):
            list_sum.append(i)
    list_num = []
    for j in list_sum:
        strnum = "4"*ln[j][0]+"7"*ln[j][1]
        list_num.append(int(strnum))
    return min(list_num)

if(ln == [] ):
    print("-1")
else:
    print(find_shorst(ln))