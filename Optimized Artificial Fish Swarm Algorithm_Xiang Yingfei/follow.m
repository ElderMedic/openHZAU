%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%follow.m : The function of following

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function follow(i)
global fish_num  Visual  crowd  Step  bestx besty max
x=0;
y=0;
Ymax=-inf;
Nf=0;
%Find the maximum density position of fish
for j=1:fish_num
   if((sqrt((bestx(j)-bestx(i))^2+(besty(j)-besty(i))^2)<Visual) && (simulatetest(bestx(j),besty(j))>Ymax))
         Ymax=simulatetest(bestx(j),besty(j));
         x=bestx(j);
         y=besty(j);
   end
end
%Calculate the number of neighbour fish
for j=1:fish_num
   if (sqrt((bestx(j)-x)^2+(besty(j)-y)^2)<Visual)
     Nf=Nf+1;
   end
end
%Renew max
if(Ymax>max)
  max=Ymax;
end
%Judge fish whether move or not
if(Ymax>1/Nf*max)
  if (((Ymax/Nf)>(crowd*simulatetest(bestx(i),besty(i))))&&(x~=bestx(i))&&(y==besty(i)))
      bestx(i)=bestx(i)+rand()*Step*(x-bestx(i))/abs(x-bestx(i));
  elseif (((Ymax/Nf)>(crowd*simulatetest(bestx(i),besty(i))))&&(x==bestx(i))&&(y~=besty(i)))
      besty(i)=besty(i)+rand()*Step*(y-besty(i))/abs(y-besty(i));    
  elseif (((Ymax/Nf)>(crowd*simulatetest(bestx(i),besty(i))))&&(x~=bestx(i))&&(y~=besty(i)))
      bestx(i)=bestx(i)+rand()*Step*(x-bestx(i))/sqrt((x-bestx(i))^2+(y-besty(i))^2);
      besty(i)=besty(i)+rand()*Step*(y-besty(i))/sqrt((x-bestx(i))^2+(y-besty(i))^2);
  else
      prey(i);
  end   
else 
      prey(i);    
end