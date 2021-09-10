function DrawCutingPlan(cp,size_roll)
n=max(cp(:,2));
colors=rand(n,3);
hold on
for i=1:size(cp,1)
    patch([cp(i,3) cp(i,5) cp(i,7) cp(i,9)],[cp(i,4) cp(i,6) cp(i,8) cp(i,10)],colors(cp(i,2),:));
end
hold off
axis equal
grid on
% xlim([1 size_roll(1,1)]);
xlim('auto')
% ylim('auto')