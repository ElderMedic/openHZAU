def num(s1,s2):
    l = min(len(s1),len(s2))
    while l>0:
        if s2[:l] == s1[-l:]:
            return l
        else:
            l-=1
    return 0
def result(s1,s2):
    n = num(s1,s2)
    s = s1 + s2[n:]
    return s
def matrix():
    s = [[0 for i in range(4)] for i in range(4)]
    return s
a0='ACCGT'
b1='CGTGC'
c2='TTAC'
d3='TACCGT'
stra=[]
m=matrix()
ma=[a0,b1,c2,d3]
for i in range(0,4):
    n=0
    k=0
    for c in range(0,4):
        l=num(ma[i],ma[c])
        if (l>n and i!=c):
            n=l
            k=c
    m[i][k]=n
for i in range(0,4):
    m[i][i]=0
for i in range(0,len(m)):
     b=[x[i] for x in m]
     if (b==[0,0,0,0]):
         k-=1
         p=i
         m.pop(p)
stra.append(p)
for i in range(0,len(m)):
    m[i].pop(p)
for i in range(0,len(m)):
     b=[x[i] for x in m]
     if (b==[0,0,0]):
         k-=1
         p=i
         m.pop(p)
stra.append(p+1)
for i in range(0,len(m)):
    m[i].pop(p)
for i in range(0,len(m)):
     b=[x[i] for x in m]
     if (b==[0,0]):
         k-=1
         p=i
         m.pop(p)
stra.append(p)
for i in range(0,len(m)):
    m[i].pop(p)
stra.append(1)
r=result(ma[stra[0]],ma[stra[1]])
rr=result(ma[stra[2]],ma[stra[3]])
rrr=result(r,rr)
