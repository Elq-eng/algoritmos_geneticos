function childn = PutNMatchP(cuts_nmatch,pos_likely,child,size_roll,cut_info,cuts)

childn = [];

    for je=1:size(cuts_nmatch,1) 
       cut_info2=cuts_nmatch(je,1);
       cut_info2=[cut_info2 cuts_nmatch(je,12:13)];
       if rand()<0.5
           cut_info2(2:3)=cuts(cut_info2(1,1),4:-1:3);
       end
       loc_dir=randperm(4);
       out=1;
       k=1;
       while out
           for jo=1:size(pos_likely,1)
                [out,part]=Check_inter(cut_info2,pos_likely(jo,:),child,size_roll,loc_dir(1,k));
                locDir=loc_dir(1,k);
                if ~out
                    break;
                end
           end
           k=k+1;
       end
       k=k-1;
       child=[child;[cut_info(je,1) part.id part.A part.B part.C part.D cut_info(je,1:3) loc_dir(1,k)]];

       pos_likely = [pos_likely; child(size(child,1),3:4)];
       pos_likely = [pos_likely; child(size(child,1),5:6)];   
       pos_likely = [pos_likely; child(size(child,1),7:8)];   
       pos_likely = [pos_likely; child(size(child,1),9:10)];   

       pos_likely=pos_likely(randperm(size(pos_likely,1)),:);
    end
    childn = child;
end