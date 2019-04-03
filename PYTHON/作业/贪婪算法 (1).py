
from functools import reduce
def get_weight(s1,s2):              #通过两条序列的重叠计算出权值
    l = min(len(s1),len(s2))
    while l>0:
        if s2[:l] == s1[-l:]:
            return l
        else:
            l-=1
    return 0


def print_result(s1,s2):           #将两条序列去除首尾重叠后合并
    weight = get_weight(s1,s2)
    s = s1 + s2[weight:]
    #print(s)
    return s


def dir_graph(l,t=3):             #得到满足条件的有向图(权值大于等于t)
    graph = {}
    for i in l:
        for j in l:
            if i!=j:
                weight = get_weight(i,j)
                if weight >= t:
                    key = (i,j)
                    graph[key] = weight
    return graph


def rm_path(graph,path):           #贪婪算法加入一条边后应该去除与该边首尾顶点相同的边
    key = graph.keys()
    rm_key = []
    for i in key:
        if i[1] == path[1] or i[0] == path[0]:
            rm_key.append(i)
    for i in rm_key:
        graph.pop(i)
    return graph


def get_path(graph,path = []):     #得到满足条件的所有边
    while graph:
        max_weight = 0
        for i in graph.keys():
            if graph[i] > max_weight:
                max_weight = graph[i]
                cur_path = i
        path.append(cur_path)
        graph = rm_path(graph,cur_path)
        get_path(graph,path)
    return path



def out_num(path,V):             #计算某顶点的出度
    count = 0
    for i in path:
        if i[0] == V:
            count+=1
    return count



def get_last_V(path,last_V = None):           #得到最后一条边
    index = 0
    if last_V:                                #非随机寻找出度为0的顶点
        for i in path:
            if i[1] == last_V:
                return i,index
            else:
                index+=1
        return None                           #没有找到指向last_V的顶点(一条路径结束)
    else:                                     #随机寻找出度为0的顶点
        for i in path:
            if out_num(path,i[1]) == 0:
                return i,index
            else:
                index+=1
        return -1                             #首尾相连




def assemble(cur_V,path,new_path = []):       #给满足条件的边排序
    while path:
        path.pop(cur_V[1])
        new_path.insert(0,cur_V[0])
        cur_V = get_last_V(path,last_V = cur_V[0][0])
        if cur_V:
            assemble(cur_V,path,new_path)
        else:
            cur_V = get_last_V(path)
            assemble(cur_V,path,new_path)
    return new_path




def align_isolated(path,sequence):          #加入孤立顶点
    new_path = reduce(lambda x,y:x+y,path)
    for i in sequence:
        if i not in new_path:
            new_path.append(i)
    return new_path




W='AGTATTGGCAATC'
Z='AATCGATG'
U='ATGCAAACCT'
X='CCTTTTGG'
Y='TTGGCAATCACT'
a = W
b = Y
c = 'TCACTAGTA'
sequence = [X,Z,U,X,Y]
sequence1 = [a,b,c]
graph = dir_graph(sequence1,t=3)
print(graph)
path = get_path(graph)
path = [list(i) for i in path]              #将path中的tuple元素换成list
#print(path)
start = get_last_V(path)                    #起始出度为0的顶点所在的边
if start == -1:                             #序列首尾相连
    new_path = reduce(lambda x,y:x+y, path)
    new_path = new_path[:-1]
    result = reduce(print_result,new_path)
else:
    new_path = assemble(start,path)             #排序后的边
    new_path = align_isolated(new_path,sequence1)   #加入孤立顶点
    #print(new_path)
    result = reduce(print_result,new_path)      #组装
#print(new_path)
print(result)
