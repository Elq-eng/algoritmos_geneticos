function pos_likely=Pos_likely_Find(child)
pos_likely=[];
for lk=1:size(child,1)
           pos_likely = [pos_likely; child(lk,3:4)];
           pos_likely = [pos_likely; child(lk,5:6)];   
           pos_likely = [pos_likely; child(lk,7:8)];   
           pos_likely = [pos_likely; child(lk,9:10)];   
       end
       pos_likely=pos_likely(randperm(size(pos_likely,1)),:);
end