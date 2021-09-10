function [out,part]=Check_inter(cut_info,pos_likely,cp,size_roll,loc_dir)
cut_size=cut_info(1,2:3);
%Se crean las partes, es decir las coordenadas donde quedara la pieza en
%base a la posicion inicial y al cuadrante escogido
switch loc_dir
    case 1
        part=create_part(cut_info(1,1),pos_likely,pos_likely+[cut_size(1,1) 0],...
                         pos_likely+[cut_size(1,1) cut_size(1,2)],pos_likely+[0 cut_size(1,2)]);
    case 2
        part=create_part(cut_info(1,1),pos_likely,pos_likely+[cut_size(1,1) 0],...
                         pos_likely+[cut_size(1,1) -cut_size(1,2)],pos_likely+[0 -cut_size(1,2)]);
    case 3
        part=create_part(cut_info(1,1),pos_likely,pos_likely-[cut_size(1,1) 0],...
                         pos_likely+[-cut_size(1,1) cut_size(1,2)],pos_likely+[0 cut_size(1,2)]);
    case 4
        part=create_part(cut_info(1,1),pos_likely,pos_likely-[cut_size(1,1) 0],...
                         pos_likely-[cut_size(1,1) cut_size(1,2)],pos_likely-[0 cut_size(1,2)]);
end
out=0;
%Se mira si la pieza esta fuera de los limites de la tela
if part.C(1,1)>size_roll(1,1) || part.C(1,2)>size_roll(1,2)||...
   part.C(1,1)<1 || part.C(1,2)<1
    out=1;
else
    for i=1:size(cp,1)
       %Revisar si hay interseccion con otras partes
       part_test=create_part(cp(i,2),cp(i,3:4),cp(i,5:6),cp(i,7:8),cp(i,9:10));
       %Se comprueba que no exista interseccion con otras partes
       out=Check_part_inter(part,part_test); 
       if out==1
          break; 
       end
    end
end