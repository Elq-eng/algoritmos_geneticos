function Fit=Fitness(cp,size_roll,cuts)

Xmax=0;
Ymax=0;

for i=1:size(cp,1)
    for j=1:2:size(cp-1,2)
        if Xmax<cp(i,j)
           Xmax=cp(i,j);
        end
    end
end

AreaTotal = size_roll(1)*size_roll(2);
AreaRes1 = size_roll(2);
AreaRes2 = size_roll(2)*(size_roll(1)-Xmax);

for ik=1:size(cp,1)
    for jk=2:2:size(cp,2)
        if Ymax<cp(ik,jk)
           Ymax=cp(ik,jk);
        end
    end
end

AreaRes3 = (Xmax-1)*(size_roll(2)-Ymax);
AreaRes = AreaRes1 + AreaRes2 + AreaRes3;
AreaSobra=EmptyArea(cp,Xmax,Ymax,cuts);

Fit=((AreaTotal-AreaSobra)/AreaTotal);

end