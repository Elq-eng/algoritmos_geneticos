function [cuts,cp] = GenCuttingPlan(parts,order,size_roll,posx,posy)
%Convertir la orden a un plan de cortes
cuts=Order2cuts(parts,order);
%Posicion inicial para colocar la primera pieza
pos_likely=[1,1];
%Plan de corte
cp=[];
%Id del primer corte
cut_id=1;
%For que barre todas las piezas de la orden
for i=1:size(cuts,1)
   %Corresponde a las dimensiones de la pieza a cortar
   cut_info=cuts(i,2:4);
   %Seccion que va a intercambiar el largo por el ancho, es como si se
   %rotara la pieza
   if rand()<0.5
       cut_info(2:3)=cuts(i,4:-1:3);
   end
   %La direccion del corte va a ir en 1 de 4 posibles, esta se selecciona
   %aleatoriamente
   loc_dir=randperm(4);
   out=1;
   %Se selecciona el cuadrante que haya quedado en primera posicion
   k=1;
   while out
       for j=1:size(pos_likely,1)
            [out,part]=Check_inter(cut_info,pos_likely(j,:),cp,size_roll,loc_dir(1,k));
            if ~out
                break;
            end
       end
       k=k+1;
   end
   k=k-1;
   %Se crea el plan de corte indicando el numero de corte, el tipo de pieza
   %y las coordenadas en las que quedo esa pieza
   cp=[cp;[cut_id part.id part.A part.B part.C part.D cut_info loc_dir(1,k)]];
   %Se incrementa el id de pieza para posicionar la siguiente
   cut_id=cut_id+1;
   %Las posiciones para poner nuevas piezas ahora son los 4 extremos de la
   %pieza
   pos_likely=[pos_likely;part.B;part.C;part.D];
   %Quita la primera pieza
   if j==1
       pos_likely=pos_likely(2:end,:);
   else
       pos_likely=[pos_likely(1:j-1,:);pos_likely(j+1:end,:)];
   end  
   pos_likely=pos_likely(randperm(size(pos_likely,1)),:);
%    clf
%    DrawCutingPlan(cp,size_roll);
end

