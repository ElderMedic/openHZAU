A = int(input())

R=0

for n in range(2,A):
    a = A
    r=1
    while(a):
        a,r = divmod(a,n)
        R += r
z = A - 2

m,n= R,z
while(n):
    m,n=n,m%n
print(str(R//m)+'/'+str(z//m))
