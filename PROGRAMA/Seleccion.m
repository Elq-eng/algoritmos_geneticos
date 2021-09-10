function pob=Seleccion(pob)

pobSel = [];

for i=1:size(pob)
    SelNum=rand*100;
    %Seleccion de los individuos por su porcentaje en la ruleta
    for j=1:size(pob)
    Rangi = pob(j).range;
    if SelNum >= Rangi(1,1) && SelNum <= Rangi(1,2)
        %Ahora todos los individuos tienen la misma probabilidad de ser
        %escogidos, ya no hay criterio de seleccion
        ind=GenInd(pob(j).gen,0,0,0,0);
        pobSel = [pobSel;ind];
    end
    end
end
pob=pobSel;
end