

from functools import reduce

def get_weight(s1,s2):               #通过两条序列的overlap计算出权值
    l = min(len(s1),len(s2))
    while l>0:
        if s2[:l] == s1[-l:]:
            return l
        else:
            l-=1
    return 0


def print_result(s1,s2):            #将两条序列去除首尾overlap后合并
    weight = get_weight(s1,s2)
    s = s1 + s2[weight:]
    #print(s)
    return s


def dir_graph(l,t=3):              #得到满足条件的有向图(权值大于等于t)
    graph = {}
    for i in l:
        VW = []
        for j in l:
            if i!=j:
                weight = get_weight(i,j)
                if weight >= t:
                    VW.append(j)
        graph[i] = VW
    #print(graph)
    for i in graph.keys():        #不能有孤立顶点
        if not graph[i]:
            count = get_in_V(graph,i)
            if count ==0:
                graph.clear()
                print('The sequence:\n"{0}"\n can\'t align with others!'.format(i))
                break
    return graph


def get_in_V(graph,v):                   #得到某顶点入度
    count = 0
    all_in = reduce(lambda x,y:x+y,graph.values())
    for i in all_in:
        if i == v:
            count+=1
    return count


def aligner(graph,topo=[]):             #得出顶点顺序
    while graph:
        V = graph.keys()
        for i in V:
            flag = 1
            in_num = get_in_V(graph,i)
            if in_num ==0:
                topo.append(i)
                graph.pop(i)
                flag = 0
                break
        if flag:                        #存在环
            #print('The t score is too small!')
            return None
        else:
            aligner(graph,topo)
    return topo


W='AGTATTGGCAATC'
Z='AATCGATG'
U='ATGCAAACCT'
X='CCTTTTGG'
Y='TTGGCAATCACT'

graph = dir_graph([W,Z,U,X,Y],t=3)
topo = aligner(graph)
if topo:
    result = reduce(print_result,topo)
else:
    result = topo
print(result)
