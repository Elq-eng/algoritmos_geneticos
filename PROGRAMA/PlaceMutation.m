 function PlacedPiece = PlaceMutation(pos_likely,piece,bg,size_roll,cut_info,cuts,loc_dir)

PlacedPiece = [];

       cut_info2=piece(1,1);
       cut_info2=[cut_info2 piece(1,12:13)];
       if rand()<0.5
           cut_info2(2:3)=cuts(cut_info2(1,1),4:-1:3);
       end
       loc_dir=randperm(4);
       out=1;
       k=1;
       while out
           for jo=1:size(pos_likely,1)
                [out,part]=Check_inter(cut_info2,pos_likely(jo,:),bg,size_roll,loc_dir(1,k));
                locDir=loc_dir(1,k);
                if ~out
                    break;
                end
           end
           k=k+1;
       end
       k=k-1;
       bg=[bg;[cut_info(1,1) part.id part.A part.B part.C part.D cut_info loc_dir(1,k)]];
       
       PlacedPiece = bg;
end