%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%prey.m : The function of prey

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function prey(i)
global try_num  Visual Step bestx besty max
t=1;
while (t<=try_num)
    t=t+1;
    x=bestx(i)+(2*rand()-1)*Visual;
    y=besty(i)+(2*rand()-1)*Visual;
    if (simulatetest(x,y)>simulatetest(bestx(i),besty(i)))
        bestx(i)=bestx(i)+rand()*Step*(x-bestx(i))/sqrt((x-bestx(i))^2+(y-besty(i))^2);
        besty(i)=besty(i)+rand()*Step*(y-besty(i))/sqrt((x-bestx(i))^2+(y-besty(i))^2);
        if (simulatetest(bestx(i),besty(i))>max)
        max=simulatetest(bestx(i),besty(i));   
        end     
    end
end
 
if((t>try_num)&&(simulatetest(bestx(i),besty(i))<max*0.5))
    bestx(i)=bestx(i)+(2*rand()-1)*Step;
    besty(i)=besty(i)+(2*rand()-1)*Step;
end