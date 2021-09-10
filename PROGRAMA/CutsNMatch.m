function [childn,cutsn,cut_infor] = CutsNMatch(point_cross,n_cuts,Parent,child,size_roll)

childn = [];
cuts_nmatch = [];
cut_infor = [];
cut_info = [];

for j=point_cross+1:n_cuts
    %Se traen todos los datos del padre dos que faltan por colocar
    cut_info=Parent(j,1);
    cut_info=[cut_info Parent(j,12:13)];
    loc_dir=Parent(j,14);
    pos_likely=Parent(j,3:4);
    [out,part]=Check_inter(cut_info,pos_likely,child,size_roll,loc_dir);
        if out==0
           child=[child;Parent(j,:)];
        else
           cuts_nmatch=[cuts_nmatch;Parent(j,:)];
           cut_infor = [cut_infor;cut_info];
        end
end

childn=child;
cutsn=cuts_nmatch;

end