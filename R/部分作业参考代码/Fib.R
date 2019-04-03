f<-function(i)
{#µİ¹é·½Ê½Çó
 if (i==1)
{result=1;}
if (i==2)
{result=1;}
if(i>=3)
{result=f(i-1)+f(i-2);}
return(result)
}