function AreaPiezas = TotalArea(cuts)

AreaPiezas = 0;

for i=1:size(cuts)
    AreaPiezas = AreaPiezas + (cuts(i,3)*cuts(i,4));
end

end