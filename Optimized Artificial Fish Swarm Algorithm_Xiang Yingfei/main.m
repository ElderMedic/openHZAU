%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%main.m : The main and entry function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialize parameters
global fish_num  try_num  Visual  crowd  Step  bestx  besty  max
fish_num=16;   %The number of vehicles(fish)
try_num=50;    %The times of trying
Visual=5;      %The visual area
crowd=0.618;   %The factor of crowding degree
Step=1.5;      %One step
Maxgen=4000;   %The maximun number of iterations
gen=0;         %The number of iterations
max=0;         %Globally optimal solution
s=0;           %The distance
sd=0;          %The average distance
p=0;           %The number of vehicles(fish) that achieve optimal solution
tsd=0;         %The sum of sd after testing
tp=0;          %The sum of m after testing
 
%
%Initialize fish
l=[-9.3425 -7.5336 -7.1463 -10.1717 -8.1757  5.8423 -11.3962 4.0464 6.4784 10.0491 -5.062 -3.628 5  7.123  11  5];
m=[-10.3173  3.0231 -9.4342 -9.9210  3.2407  6.1738 -10.9795 3.7457 8.4011 10.1560  5.233  5.253 -5 -6.236 -7 -1];
bestx=l;
besty=m;
 
%The main part of Optimized AFSA
for try_num=1:10000
while gen<Maxgen
for i=1:fish_num
switch (AF_evaluate(i))
   case  0
       follow(i);
   case  1
       aggregate(i);
end
gen=gen+1;
end
end
%Calculate the number m of vehicles(fish) that locate in the global optimal central area
p=0;
for i=1:fish_num
    if(simulatetest(bestx(i),besty(i))>0.9)
        p=p+1;
    end
end
%
 
%Calculate the average distance sd
s=0;
for i=1:fish_num
    s=s+sqrt((bestx(i))^2+(besty(i))^2);
end
sd=s/fish_num;
%
tp=tp+p;
tsd=tsd+sd;
end
tp=tp/10000;
tsd=tsd/10000;
fprintf('The number of vehicles£º%g  The average distance£º%g \n',tp,tsd);
 
%Plot Scatters
for a=-5*pi:0.01:5*pi
  for b=-5*pi:0.01:5*pi
    if (sin(a)*sin(b)/(a*b)>0.99)
plot(l,m,'r*');
plot(l,m,'m*',bestx,besty,'c*',a,b,'ok');
xlabel('The distance X to the higher density area(km)');
ylabel('The distance Y to the higher density area(km)');
   end
  end
end

% %Plots
% StoStep(pw)=Step;
% StoTp(pw)=tp;
% StoTsd(pw)=tsd;
% C=polyfit(StoStep,StoTsd,2);
% Z=polyval(C,StoStep);
% plot(StoStep,StoTp,'r*',StoStep,Z,'b');
% plot(StoStep,StoTsd,'r*',StoStep,Z,'b');