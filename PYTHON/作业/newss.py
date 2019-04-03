with open("D:\\NC_006270.fna") as f:
    complete = f.read()
import csv

with open('D:\\NC_006270.csv', 'rt') as csvfile:
    reader = csv.reader(csvfile)
    rows = [row for row in reader]

complete = complete.replace("\n", "")
complete = complete[92:-1]
lengthinfo = len(rows)

# creating a dict whose keys are"1,2,3,4···etc"
i = 3
for i in range(3, lengthinfo):
    rows[i - 3] = rows[i]

a = [0 for i in range(3, lengthinfo)]
b = 1
for i in range(len(a)):
    a[i] += b
    b += 1

locstart = dict.fromkeys(a, "")
locstend = dict.fromkeys(a, "")
locstrand = dict.fromkeys(a, "")

seqqq = []
for i in range(len(rows)):
    row = str(rows[i])
    row = row.replace("[", "")
    row = row.replace("'", "")
    seqqq.append(row)

# complete,seqqq well be usable
# get startloc endloc and strand type
for i in range(len(seqqq)):
    strcut = str(seqqq[i]).split("..", 1)
    locstart[i] = strcut[0]
    strcut = str(strcut[1]).split("\\t")
    locend[i] = strcut[0]
    locstrand = strcut[1]

xulie = []
temp = []
for i in range(len(complete)):
    for j in range(len(locstart)):
        if i == locstart[j]:
            temp.append(complete[i])
        if i == locend:
            xulie.append(str(temp))
            continue
