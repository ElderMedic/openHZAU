%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%AF_evaluate.m : The function of evaluating and judging the action of artificial fish

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function s=AF_evaluate(i)
global bestx besty fish_num Visual
Xcx=0;Xcy=0;Nf=0;Ymax=-inf;

%Calculate Xcx,Xcy
for j=1:fish_num
    if (sqrt((bestx(j)-bestx(i))^2+(besty(j)-besty(i))^2)<Visual)
        Nf=Nf+1;
        Xcx=Xcx+bestx(j);
        Xcy=Xcy+besty(j);
    end
end 
     Xcx=Xcx/Nf;
     Xcy=Xcy/Nf;

%Calculate Ymax
for j=1:fish_num
    if((sqrt((bestx(j)-bestx(i))^2+(besty(j)-besty(i))^2)<Visual) && (simulatetest(bestx(j),besty(j))>Ymax))
        Ymax=simulatetest(bestx(j),besty(j));
    end
end

%Calculate s
if (simulatetest(Xcx,Xcy)>Ymax)
    s=0;
else
    s=1;
end
