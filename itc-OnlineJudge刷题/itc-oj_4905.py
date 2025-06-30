# 接受输入
from functools import reduce
stra = input()
d = {}
d['?']=0
for s in stra:
    if(s=='?' or s.isupper()):
        d[s]=d.get(s,0) + 1
listb = list(d.items())
cha = len(listb) - 1
# print("CHA IS "+str(cha))

if(stra[0]=='?'):
    mwen = 9 if d['?']==1 else 9*10**(d['?']-1)
    mcha = 1 if cha==0 else reduce(lambda x,y: x*y,range(10-cha+1,11))
elif(stra[0].isupper()):
    mwen = 1 if d['?']==0 else 10**(d['?'])
    mcha = 9* (1 if cha ==1 else reduce(lambda x,y: x*y,range(9-cha+2,10)))
else:
    mwen = 1 if d['?']==0 else 10**(d['?'])
    mcha = 1 if cha==0 else reduce(lambda x,y:x*y, range(10-cha+1,11))

# print("mwen is "+str(mwen))
# print("mcha is "+str(mcha))
if (mwen==1 and mcha==1):
    m=0
else:
    m=mwen*mcha
print(m)
        