f<-function(i)
{#�ݹ鷽ʽ��
 if (i==1)
{result=1;}
if (i==2)
{result=1;}
if(i>=3)
{result=f(i-1)+f(i-2);}
return(result)
}