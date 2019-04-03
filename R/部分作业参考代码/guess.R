num=floor(runif(1, min = 1, max = 99))

for(i in 1:7)
{m=c(scan(file="",what=double(), n = 1));
#m=scan(file="",what=double(),nmax = -1, n = -1, sep = "");#直接运行会把第二行的内容当做m的输入,则先运行第一行
 if (m>num)
{cat('high');
else 
{if (m<num)
{cat("low");}
else 
{cat("win");break}
}
}
}
if (i==7)
cat("lose")