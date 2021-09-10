function Draw_LinesToShow(p_ini,p_fin, ColorChoosen)
pa=p_ini; 
pb=[p_fin(1,1) p_ini(1,2)];
pc=p_fin; 
pd=[p_ini(1,1) p_fin(1,2)];
%Se dibujan lineas que representan el perimetro del terreno
Draw_Line(pa,pb); 
Draw_Line(pb,pc);
Draw_Line(pc,pd);
Draw_Line(pd,pa);

x=[p_fin(1,1) p_ini(1,1) p_ini(1,1) p_fin(1,1) ];
y=[p_fin(1,2) p_fin(1,2) p_ini(1,2) p_ini(1,2) ];
%Se dibuja el terreno con el color deseado
patch(x,y,ColorChoosen)

hold on
grid on
end