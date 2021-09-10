function cuts=Order2cuts(parts,order)
cuts=[];
k=1;
for i=1:size(order,1)
   for j=1:order(i,2)
       cuts=[cuts;[k parts(i,1:3)]];
       k=k+1;
   end
end