function [pobMut,pobMutOrdered]=Mutacion(pobCru,size_roll,parts,order)
    
    cuts=Order2cuts(parts,order);
    
    [Muts,Muts2]=RealMutation(pobCru,size_roll,cuts);
    
    pobMut = Muts;
    
    pobMutOrdered = Muts2;

%Organizar por heuristica
for il=1:size(pobMutOrdered)
    for ik=1:size(pobMutOrdered)
    if pobMutOrdered(il).heuristica >= pobMutOrdered(ik).heuristica
    else
       tempA=pobMutOrdered(il).heuristica;
       tempB=pobMutOrdered(ik).heuristica;
       tempC=pobMutOrdered(il).gen;
       tempD=pobMutOrdered(ik).gen;
       
       pobMutOrdered(ik).heuristica=tempA;
       pobMutOrdered(il).heuristica=tempB;
       pobMutOrdered(ik).gen=tempC;
       pobMutOrdered(il).gen=tempD;
    end
    end
end

end