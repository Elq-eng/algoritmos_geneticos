function out=Check_line_inter(line1,line2)
out=0;
if line1.dir~=line2.dir
    lim_lin1_min=line1.range(1,1);
    lim_lin1_max=line1.range(1,2);
    lim_lin2_min=line2.range(1,1);
    lim_lin2_max=line2.range(1,2);
    if line1.pos>lim_lin2_min && line1.pos<lim_lin2_max &&...
       line2.pos>lim_lin1_min && line2.pos<lim_lin1_max
       out=1; 
    end
end