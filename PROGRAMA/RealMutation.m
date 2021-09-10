function [Muts,Muts2]=RealMutation(pobCru,size_roll,cuts)
MutationParam = [];
    RandomPiece = [];
    Mut = [];
    Muts = [];
    Muts2 = [];
    Piece = [];
for i=1:size(pobCru)
        Cp = [];
        Cp = pobCru(i,:).gen;
        %Genero un parametro de mutacion. Se va a mutar aproximadamente al
        %10% de los individuos
        MutationParam = rand();
        if MutationParam < 0.2
           BgP = [];
           size_Piece = [];
           %Se selecciona una pieza aleatoria para mutar  
           RandomPiece = randi(size(Cp,1));
           if RandomPiece == 1
              BgP = [BgP Cp(RandomPiece:end,:)];
           elseif RandomPiece == size(Cp)
              BgP = [BgP Cp(1:RandomPiece-1,:)];
           else
              BgP = [BgP Cp(1:RandomPiece-1,:);Cp(RandomPiece+1:end,:)];
           end
           idPiece = Cp(RandomPiece,1);
           size_Piece = Cp(RandomPiece,12:13);
           cut_info = [idPiece size_Piece];
           loc_dir = Cp(RandomPiece,14);
           
           Piece = Cp(RandomPiece,:);
           
           pos_likely=Pos_likely_Find(BgP);
           
           Mut = PlaceMutation(pos_likely,Piece,BgP,size_roll,cut_info,cuts,loc_dir);

           ind2=GenInd(Mut,0,0,0,0);
           Muts = [Muts;ind2];
           
           Heu=Fitness(Mut,size_roll,cuts);
           ind3=GenInd(Mut,Heu,0,0,0);
           Muts2 = [Muts2;ind3];
        else
           ind2=GenInd(Cp,0,0,0,0);
           Muts = [Muts;ind2];
           
           Heu=Fitness(Cp,size_roll,cuts);
           ind3=GenInd(Cp,Heu,0,0,0);
           Muts2 = [Muts2;ind3];
        end
    end
end