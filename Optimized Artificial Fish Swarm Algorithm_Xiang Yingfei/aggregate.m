%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%aggregate.m : The function of aggregation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function aggregate(i)
global fish_num  Visual  crowd  Step  bestx besty max
Nf=0;       %The number of neighbour fish
Xcx=0;Xcy=0;%The central position of neighbour fish
%Calculate the whole central position of fish
for j=1:fish_num
   if (sqrt((bestx(j)-bestx(i))^2+(besty(j)-besty(i))^2)<Visual)
        Nf=Nf+1;
        Xcx=Xcx+bestx(j);
        Xcy=Xcy+besty(j);
   end
end

%Calculate the average central position of fish
     Xcx=Xcx/Nf;
     Xcy=Xcy/Nf;
%Renew max
if(simulatetest(Xcx,Xcy)>max)
   max=simulatetest(Xcx,Xcy);
end
%Judge fish whether move or not
if(simulatetest(Xcx,Xcy)>1/Nf*max)
  if((simulatetest(Xcx,Xcy)/Nf>simulatetest(bestx(i),besty(i))*crowd)&&(Xcx~=bestx(i))&&(Xcy==besty(i)))
      bestx(i)=bestx(i)+rand()*Step*(Xcx-bestx(i))/abs(Xcx-bestx(i));
  elseif ((simulatetest(Xcx,Xcy)/Nf>simulatetest(bestx(i),besty(i))*crowd)&&(Xcx==bestx(i))&&(Xcy~=besty(i)))
      besty(i)=besty(i)+rand()*Step*(Xcy-besty(i))/abs(Xcy-besty(i));
  elseif ((simulatetest(Xcx,Xcy)/Nf>simulatetest(bestx(i),besty(i))*crowd)&&(Xcx~=bestx(i))&&(Xcy~=besty(i)))
      bestx(i)=bestx(i)+rand()*Step*(Xcx-bestx(i))/sqrt((Xcx-bestx(i))^2+(Xcy-besty(i))^2);
      besty(i)=besty(i)+rand()*Step*(Xcy-besty(i))/sqrt((Xcx-bestx(i))^2+(Xcy-besty(i))^2);
  else
      prey(i);    
  end
else
      prey(i);
end