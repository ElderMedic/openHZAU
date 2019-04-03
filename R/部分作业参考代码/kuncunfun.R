kuncunfun=function(n)#n为模拟次数
{ result=NULL;
  for(z in 1:n)
  { 
  days=30;#模拟时间长度
  storage=matrix(0,1,30);
  P=matrix(c(125,150,150,250),ncol=2,byrow=TRUE);#模拟方案矩阵
  for (k in 1:length(P[,1]))
  {
   ##基本参数
   	cost=0;arrivalday=3;
	storagefee=0.5;lossfee=1.6;bookfee=75;
	storage0=110;booknum=0;arrivaldate=0;
   ##
   bookpoint=P[k,1];
   for (i in 1:days) #while亦可
    {
     ##早上到货
      if (i==1)
       {
          storage[i]=storage0;#初始库存
       }
      else
      { 
         if (arrivaldate==i)#检查这一天是否为预定到货日期
           {
             storage[i]=storage[i]+ booknum;
             booknum=0;arrivaldate=0;
            }
       }
   ##全天销售
      sale=floor(runif(1, min = 1, max = 99));#随机需求量
      if(storage[i]>sale)
		{
            storage[i]=storage[i]-sale;
		shortagenum=0;
            }
	else
 		{
            shortagenum=sale-storage[i];
 		storage[i]=0;
            }
   ## 每天晚上库存盘点
       if(storage[i]<bookpoint & arrivaldate==0)#且没有订过货时
  	  	
             {
             booknum=P[k,2];
 		 arrivaldate=i+3;
 		 orderfee=bookfee;
             }
	   else
  		{
             orderfee=0;#不订货或者订货费加一次就不再加了
            }
        
   ## 计算当天总费用 假设以晚上库存量计算库存保管费
	 cost=cost+storage[i]*storagefee+shortagenum*lossfee+orderfee;
   ##
      }
      cat('第',z,'次模拟：第',k,'种方案的总费用为',cost,'\r\n');
	result=rbind(result,c(z,k,cost));
   }
}
return(result);
}