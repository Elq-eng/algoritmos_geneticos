function pob_out=Cruce(pob,size_roll,parts,order)
    %Convertir la orden a un plan de cortes
    cuts=Order2cuts(parts,order);
    %Numero de cortes a realizar
    n_cuts=size(pob(1,:).gen,1);
    cut_info = [];
    %Hijos generados
    Sons = [];
    
    for i=1:2:size(pob,1)
        %Se trae toda la informacion de dos padres
        Paren1=pob(i,:).gen;
        Paren2=pob(i+1,:).gen;
        %Se escoge un punto de cruze del genotipo
        point_cross=randi(n_cuts);
        
        %% Primer Hijo
        child1=Paren1(1:point_cross,:);
        
        %Se crea un arreglo que contendra las partes que no se puedieron
        %colocar de un padre en otro
        cuts_nmatch=[];
        
        %Funcion que inserta los elementos que se puedan del padre 2 en el
        %hijo 1 y muestra que valores no se pudieron poner
        [child1,cuts_nmatch,cut_info] = CutsNMatch(point_cross,n_cuts,Paren2,child1,size_roll);

        %Se verifica si hubo alguna pieza que no se haya podido insertar 
        if size(cuts_nmatch)==0
        else
            pos_likely=Pos_likely_Find(child1);
            child1 = PutNMatchP(cuts_nmatch,pos_likely,child1,size_roll,cut_info,cuts);
        end
        ind1=GenInd(child1,0,0,0,0);
        Sons = [Sons;ind1];
        
        %% Segundo Hijo
        child2=Paren2(1:point_cross,:);
        
        %Se crea un arreglo que contendra las partes que no se puedieron
        %colocar de un padre en otro
        cuts_nmatch2=[];
        
        %Funcion que inserta los elementos que se puedan del padre 1 en el
        %hijo 2 y muestra que valores no se pudieron poner
        [child2,cuts_nmatch2,cut_info2] = CutsNMatch(point_cross,n_cuts,Paren1,child2,size_roll);
        
        %Se verifica si hubo alguna pieza que no se haya podido insertar 
        if size(cuts_nmatch2)==0
        else
            pos_likely2=Pos_likely_Find(child2);
            child2 = PutNMatchP(cuts_nmatch2,pos_likely2,child2,size_roll,cut_info2,cuts);
        end
        
        ind2=GenInd(child2,0,0,0,0);
        Sons = [Sons;ind2];
        
    end
    pob_out=Sons;
end