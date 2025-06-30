m ,n = tuple(input().split())
m,n = int(m), int(n)

wall_list = []

for i in range(m):
    wall_list.append(input().strip())

# print(wall)

wall = wall_list[-1]

state = 0
sum = 0

for i in wall:
    if(i == "B"):
        state = 1
    else:
        if(state==1):
            sum+=1
            state = 0
else:
    if(state==1):
        sum+=1

print(sum)
