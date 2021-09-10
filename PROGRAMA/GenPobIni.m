function pob=GenPobIni(parts,order,size_roll,n_ind, posx, posy)
pob=[];
Rango=[0 0];
for i=1:n_ind
    [cuts,cp]=GenCuttingPlan(parts,order,size_roll,posx, posy);
    Heu=Fitness(cp,size_roll,cuts);
    ind=GenInd(cp,Heu,0,0,Rango);
    pob=[pob;ind];
end

%Organizar por heuristica
for il=1:size(pob)
    for ik=1:size(pob)
    if pob(il).heuristica >= pob(ik).heuristica
    else
       tempA=pob(il).heuristica;
       tempB=pob(ik).heuristica;
       tempC=pob(il).gen;
       tempD=pob(ik).gen;
       
       pob(ik).heuristica=tempA;
       pob(il).heuristica=tempB;
       pob(ik).gen=tempC;
       pob(il).gen=tempD;
    end
    end
end

HeuTotal=0;

%Calculo del total de la heuristica
for ilk=1:size(pob)
    HeuTotal = HeuTotal + pob(ilk).heuristica;
end

%Asignacion del primer rango
for ilz=1:size(pob)
    itn = (pob(ilz).heuristica/HeuTotal)*100;
    pob(ilz).fitness = itn;
    Rango(1,2)=ilz;
    pob(ilz).range = Rango;
end

%Calculo de probabilidad
for pos=1:size(pob)
    probabilidad=ProbCalc(pob,pos);
    pob(pos).probability = probabilidad;
end

probTotal=0;

%Calculo del total de la probabilidad
for pos2=1:size(pob)
    probTotal = probTotal + pob(pos2).probability;
end

%Ajuste de probabilidad al 100
for pos3=1:size(pob)
    probabilidadR=(pob(pos3).probability * 100)/probTotal;
    pob(pos3).probability=probabilidadR;
end

probTotal=0;
%Calculo del total de la probabilidad
for pos4=1:size(pob)
    probTotal = probTotal + pob(pos4).probability;
end

probAcum=0;
%Rangos de probabilidad
for ra=size(pob):-1:1
    probabi=pob(ra).probability;
    probAcum= probAcum + probabi;
    Rango = [probAcum-probabi+0.0001 probAcum];
    pob(ra).range=Rango;
end