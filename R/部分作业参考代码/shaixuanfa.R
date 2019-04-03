m=scan(file="",what=double(),n=1)
x=c(2:m)#直接运行会把第二行的内容当做m的输入,则先运行第一行
if （m>=1）
{
for(i in 2:floor(sqrt(m))+1)
{inx=which(x%%i==0 &(x!=i) );
 if (length(inx)!=0)
   {x=x[-inx]}
 }
x
}