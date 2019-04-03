#! ~/my_software/anaconda2/bin/python
# _*_ coding: UTF-8 _*_

################################################################################
# Date: 2017-10-30
# Email: menghaowei1992@126.com
################################################################################

# 定义变量用来保存chrM的所有序列
chrM_genome = ""

with open("./chrM.fa","r") as input_file:		# 打开文件，使用with open语句打开，文件在读取结束后自动关闭
	for line in input_file: 					# 使用for循环进行读取文件，每次读取1行
		if line[0] != ">": 						# 当读取到的内容不是标题的时候，就是序列内容
			line = line.strip().upper() 		# strip去掉行末的换行符，upper是把所有的序列都转换成大写 
			chrM_genome = chrM_genome + line	# 将新读取的行添加到之前的序列

# 统计A，T，G，C的数量
print("A count is {0}".format(chrM_genome.count("A")))
print("T count is {0}".format(chrM_genome.count("T")))
print("C count is {0}".format(chrM_genome.count("C")))
print("G count is {0}".format(chrM_genome.count("G")))

# 统计线粒体参考基因组的长度
print("chrM total length is: {0} bp".format(len(chrM_genome)))


