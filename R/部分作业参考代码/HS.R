HS1 <-function()
  x<-vector("numeric")
  t<-vector("numeric")
  x=seq(-3,3,by=0.01)
  t=seq(-3,3,by=0.01)
  y1=(exp(x)-exp(-x))/2
  x1=(t-sin(t))/2
  y2=(1-cos(t))/2
  plot(x,y1,col=2,type='l',main="函数图",
       lty=1,)
  points(t,x1,col=3,type="l")
  points(t,y2,col=4,type="l")
  
  