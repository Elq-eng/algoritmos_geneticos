function Draw_Line(p_ini,p_fin)
hold on;
plot([p_ini(1,1),p_fin(1,1)],[p_ini(1,2),p_fin(1,2)],'k-')
hold off;
end